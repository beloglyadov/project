#!/bin/bash

##################################### УСТАНОВКА СОФТА #####################################

#Подготовка сервера, установка приложений для работы, а также включаем службы в автозапуск HTTPD и MySQL, установка Docker, Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install php php-curl php-xml php-zip php-mysqlnd php-intl php-gd php-json php-ldap php-mbstring php-opcache docker-ce -y && systemctl enable --now docker  
yum update -y && yum install -y mysql-server httpd vim wget tar && systemctl enable httpd --now && systemctl enable mysqld --now 

#Права на папки Docker Compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

##################################### MYSQL ЧИСТАЯ УСТНОВКА #####################################

#Настройка базы mysql_secure_installation
#cat > mysql_secure_installation << EOF
# Удаляем анонимных пользователей
#DELETE FROM mysql.user WHERE User='';
# Отключаем удалённое подключение для пользователя 'root' с других хостов
#DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# Удаляем демонстрационную базу данных
#DROP DATABASE IF EXISTS test;
#DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# Применяем изменения
#FLUSH PRIVILEGES;
#EOF

# Устанавливаем пароль с методом шифрования sha2 для входа в MySQL, чтобы нельзя было подключиться без пароля
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Otus321$';"

#Создаём файл .my.cnf, чтобы входить в MySQL без пароля
#cat > ~/.my.cnf << EOF
#[client]
#password="Otus321$"
#EOF

#Создаём базу данных для сайта
#mysql -e "CREATE DATABASE joomla;"
#Пароль для базы с localhost'a
#mysql -e "CREATE USER juser@localhost IDENTIFIED BY 'mypassword';"
#Доступы на базу joomla для пользователя juser
#mysql -e "GRANT ALL PRIVILEGES ON joomla.* TO juser@localhost;"

#Создаём пользователя для репликации на мастере
#mysql -e "CREATE USER repl@192.168.0.17 IDENTIFIED WITH caching_sha2_password BY 'OtusProject@$';"
#Даём праван все базы и таблицы
#mysql -e "GRANT REPLICATION SLAVE ON *.* TO repl@192.168.0.17;"
#Применяем изменения
#mysql -e "FLUSH PRIVILEGES;"

#SELECT User, Host FROM mysql.user; 
#SHOW MASTER STATUS\G; 
#SHOW DATABASES;

##################################### MYSQL ВОССТАНОВЛЕНИЕ ИЗ БЭКАПА #####################################

#Переходим в директорию с проектом, копируем наш сайт, восстанавливаем базу целиком из бэкапа
cd /tmp/project/site
cp -r ./joomla /var/www/html
mysql < ./exam_db.sql
systemctl restart mysqld
#Создаём файл .my.cnf, чтобы входить в MySQL без пароля
cat > ~/.my.cnf << EOF
[client]
password="Otus321$"
EOF

##################################### JOOMLA #####################################

#Подготовка к установке и настройке CMS Joomla 3.9.3
#mkdir /tmp/project/tempJL
#cd /tmp/project/tempJL
#wget https://github.com/joomla/joomla-cms/releases/download/3.9.3/Joomla_3.9.3-Stable-Full_Package.tar.gz
#mkdir /var/www/html/joomla
#tar -xvzf Joomla_3.9.3-Stable-Full_Package.tar.gz -C /var/www/html/joomla
#rm -Rf /tmp/project/tempJL

#Назначаем владельцем пользователя apache, настраиваем права доступа к директориям
#chown -R apache:apache /var/www/html/joomla
#chmod -R 755 /var/www/
#systemctl restart httpd


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

#Запуск контейнеров Prometheus, Node_exporter, cAdvisor, Grafana
docker-compose up -d

##################################### ELK #####################################

#Качаем и устанавливаем Filebeat локально
cd /tmp/project/elk-filebeat

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.2-x86_64.rpm
sudo rpm -vi filebeat-7.11.2-x86_64.rpm

cp --force /tmp/project/elk-filebeat/filebeat.yml /etc/filebeat/

filebeat modules enable apache
service filebeat start

docker-compose up -d
#filebeat setup
