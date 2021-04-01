#!/bin/bash

##################################### SLAVE #####################################
##################################### MYSQL ЧИСТАЯ УСТАНОВКА. НАСТРОЙКА РЕПЛИКАЦИИ #####################################

#Установка MySQL, включаем службы в автозапуск MySQL
yum update -y && yum install -y mysql-server vim  && systemctl enable mysqld --now 

#Установка sshpass для подключения к slave серверу без пароля 
cd /tmp
yum install wget -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -ivh epel-release-latest-8.noarch.rpm
yum -y install sshpass

#Создаём файл mysql-server.cnf для корректной настройки репликации
cat > /etc/my.cnf.d/mysql-server.cnf <<EOF
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
log-error=/var/log/mysql/mysqld.log
pid-file=/run/mysqld/mysqld.pid
bind-address=192.168.0.17
server-id=2
read_only=ON
EOF

#Переапускаем службу, чтобы применить изменения для вышесозданного файла
systemctl restart mysqld

#Устанавливаем пароль с методом шифрования sha2 для входа в MySQL, чтобы нельзя было подключиться без пароля
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Otus#Slave^5@';"

#Создаём файл .my.cnf, чтобы входить в MySQL без пароля
cat > ~/.my.cnf << EOF
[client]
password="Otus#Slave^5@"
EOF

#Настраиваем репликацию с мастером
mysql -e "STOP SLAVE;" 
mysql -e "CHANGE MASTER TO MASTER_HOST='192.168.0.21', MASTER_USER='repl', MASTER_PASSWORD='OtusProject@$', MASTER_LOG_FILE='binlog.000001', MASTER_LOG_POS=1, GET_MASTER_PUBLIC_KEY = 1;"
mysql -e "START SLAVE; SHOW SLAVE STATUS\G" 

#В планировщик добавляем скрипт, который каждую минуту проверяет состояние главного сервера, где запущен сайт
#Если ответ сайта не равен 'HTTP/1.1 200 OK', то он тушит полностью главный сервер и поднимает резеврный, 
#где с нуля разворачивает всё для работы сайта и мониторинга

cat > ~/crontab.txt << EOF
*/1 * * * * ~/shut-master.sh
EOF

crontab < ~/crontab.txt 

#Отключаем SELINUX и FIREWALLD, перезапускаем для применения изменений SELINUX
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
systemctl disable firewalld --now
reboot
