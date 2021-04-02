#!/bin/bash

##################################### MASTER УСТАНОВКА СОФТА #####################################

#Подготовка сервера, установка приложений для работы, а также включаем службы в автозапуск HTTPD и MySQL, установка Docker, Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install php php-curl php-xml php-zip php-mysqlnd php-intl php-gd php-json php-ldap php-mbstring php-opcache docker-ce -y && systemctl enable --now docker  
yum update -y && yum install -y mysql-server httpd vim wget tar && systemctl enable httpd --now && systemctl enable mysqld --now 

#Права на папки Docker Compose для запуска  
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Скачиваем проект
cd /tmp
git clone https://github.com/beloglyadov/project

##################################### MYSQL ВОССТАНОВЛЕНИЕ ИЗ БЭКАПА #####################################

#Переходим в директорию с проектом,, 
cd /tmp/project/site
#Копируем наш сайт по указанному пути, где он лежал
cp -r ./joomla /var/www/html
#Восстанавливаем базу целиком из бэкапа
mysql < ~/exam_db_new.sql
#Переапускаем службу, чтобы применить изменения для вышесозданного файла
systemctl restart mysqld

#Настраиваем файл mysql-server.cnf
cat <<EOF > /etc/my.cnf.d/mysql-server.cnf
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
log-error=/var/log/mysql/mysqld.log
pid-file=/run/mysqld/mysqld.pid
bind-address=192.168.0.22
server-id=1
EOF

systemctl restart mysqld

#Создаём файл .my.cnf, чтобы входить в MySQL без пароля
cat > ~/.my.cnf << EOF
[client]
password="Otus321$"
EOF

#Установка sshpass для подключения к slave серверу без пароля 
cd /tmp
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm -ivh epel-release-latest-8.noarch.rpm
cd ..
yum -y install sshpass

##################################### PROMETHEUS & GRAFANA #####################################

#Создаём учетную запись для приложения apache_exporter
groupadd --system apache_exporter
useradd -s /bin/false -r -g apache_exporter apache_exporter
#Выполняем загрузку и установку приложения-экспортера Prometheus Apache
mkdir /tmp/project/prom-grafana/apache_exporter
cd /tmp/project/prom-grafana/apache_exporter
cp -f ../apache_exporter.service /etc/systemd/system/apache_exporter.service
wget https://github.com/Lusitaniae/apache_exporter/releases/download/v0.5.0/apache_exporter-0.5.0.linux-amd64.tar.gz
tar -zxvf apache_exporter-0.5.0.linux-amd64.tar.gz
install apache_exporter-0.5.0.linux-amd64/apache_exporter /usr/local/bin/
cd ..
rm -rf /tmp/prom-grafana/apache_exporter

systemctl daemon-reload
systemctl enable apache_exporter --now

##################################### ELK #####################################

#Качаем и устанавливаем Filebeat локально
cd /tmp/project/elk-filebeat

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.2-x86_64.rpm
sudo rpm -vi filebeat-7.11.2-x86_64.rpm

cp -f /tmp/project/elk-filebeat/filebeat.yml /etc/filebeat/

filebeat modules enable apache
systemctl enable filebeat --now

#Включаем репликацию на slave
sshpass -p 123 ssh root@192.168.0.17 mysql -e "CHANGE MASTER TO MASTER_HOST='192.168.0.22', MASTER_USER='repl', MASTER_PASSWORD='OtusProject@$', MASTER_LOG_FILE='binlog.000001', MASTER_LOG_POS=1, GET_MASTER_PUBLIC_KEY = 1; START SLAVE;"

#Отключаем SELINUX и FIREWALLD, перезапускаем для применения изменений SELINUX
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
systemctl disable firewalld --now
chmod +rx /tmp/project/master/launch-mon.sh
reboot
