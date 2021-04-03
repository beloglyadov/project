# Итоговый проект

## Тема: автоматическая настройка и восстановления веб-сервера 
____
- Количество серверов: 3 шт.

- Используемая ОС: CentOS 8

- Используемая сеть: 192.168.0.0/24

- Master сервер: 19.168.0.21/24

- Slave сервер: 192.168.0.17/24

- Сервер-замена : 192.168.0.22/24
____

Устанавливаем и настраиваем GIT:

    yum -y install git
Скачиваем репозиторий, например в /tmp:

    git clone https://github.com/beloglyadov/project
____
> Каталог **project**
> >
> > > elk-filebeat #Подкаталоги: стек Elasticsearch/Logstash/Kibana для Docker Compose 
> >  
> > > master #Каталог со скриптами настройки **master**, сервера замены и скриптом настройки мониторинга
> > 
> > > prom-grafana #Каталог с файлами настройки Prometheus 
> > 
> > > site #Подкаталог joomla с уже установленным сайтом и бэкапом БД: exam_db.sql
> > 
> > > slave #Каталог со скриптами настройки **slave** сервера и проверки состояния веб-сервера 
> >

# Цель проекта
Главная цель - продемонстрировать автоматическую настройку на **master** сервере рабочего сайта, его мониторинга и логирования, 
а также рпеликацию БД на **slave** сервере, на котором в свою очередь будет производиться раз в минуту проверка состояния веб-сервера на *master*. 
В случае если веб-сервер недоступен или возвращает ошибку, **master** будет выключен и запущено автоматическое восстановление на *master-new* 
до полностью рабочего состояния и настройки репликации БД со **slave** сервером.  
____
## Порядок установки 
Установка всех серверов производится в автоматическом режиме. Выполнение всех шагов установки начинается с **master** сервера.
В самом скрипте *master.sh* будет запущена установка и **slave** сервера.
____
### Установка на MASTER сервере:
Выполняем подгтовку к запуску скрипта *master.sh*. Для этого необходимо перейти в каталог 

    cd /tmp/project/master/
дать права на выполнение скрипта *master.sh* и запустить его на выполнение.
    
    chmod +x ./master.sh && ./master.sh
После чего будет установлен и настроен **master** сервер:

    - установлена БД MySQL и веб-сервер httpd
    - восстановлен из бэкапа сайт на CMS Joomla
    - дополнительный софт для нормальной работы сайта 

Далее идёт установка **sshpass**, чтобы без ввода пароля на *slave* можно было скопировать скрипт установки и настройки и дать права на запуск.
____
### Установка на SLAVE сервере:

Когда скрипт будет скопирован и заущен через ssh с главного сервера на **slave** будет выполнена чистая установка БД MySQL и настроена репликация 
с **master**, а также задача в crontab для провреки состояния веб-сервера на  **master**.

На **Slave** сервере будет отключен firewalld и selinux, после этого сервер перезагрузится для применения изменений. 
____
### Продолжение установки на MASTER'e:

Для удобства *Prometheus* и *ELK* будут запущены в контейнерах с помощью описанных файлов docker-compose.yml
____
#### Prometheus (мониторинг)

Бдует продолжена установка доп.модуля для *apache_exporter* в *Prometheus*:

    - выданы права 
    - созданы пользователи для их запуска
    - служба будет установлена в автозапуск
   
____
#### ELK (логирование). Filebeat

Установка *Filebeat* производится локально; конфигурационный файл *filebeat.yml* будет заменён, затем сам *Filebeat* будет добавлен в автозапуск.
____
После установки *Filebeat* на **master'e** будет также выполнение отключение *firewalld* и *selinux* и сервер будет перезапущен.
____
### Запуск мониторинга и логирования на MASTER

Когда **master** будет перезапущен, мы можем зайти на страницу нашего сайта для проверки корректности его работы *http://192.168.0.21/joomla*.

Для запуска мониторинга и логирования нам потребуется выполнить скрипт:
    
    /tmp/project/master/launch-mon.sh
Ждём несколько минут пока все контейнеры будут скачаны и запущены, проверяем работу мониторинга и логирования по следующим ссылкам: 
    
    *http://192.168.0.21:9090* - Prometheus
    *http://192.168.0.21:3000* - Grafana
    *http://192.168.0.22:5601* - Kibana

        Пользователь: **elastic**
        Пароль: **changeme**
____        
### Проверка восстановления 

Теперь проверим как будет происходить восстановления работы сайта в случае его сбоя. Перемещаем папку с сайтом или каким-либо другим способом выводим его из строя.
    
    mv /var/www/html/joomla ~/
Каждую минуту на **slave** сервере, если не будет возвращен от сайта ответ 200, то:

    - будет выключен master
    - остановлена репликация на slave
    - выполнен бэкап БД exam_db_new.sql на slave, передача его на master-new
    - запущено удалённое копирование скрипта master-new.sh на master-new и его выполнение

Данный скрипт почти аналогичен скрипту *master.sh*, исключая шаги настройки **slave** через ssh, за исключением в конце его работы будет выполнена настройка репликации БД со **slave**. 
После завершения работы скрипта *master-new.sh* сервер перезагрузится и можно будет выполнить скрипт запуска мониторинга и логирования *launch-mon.sh*
