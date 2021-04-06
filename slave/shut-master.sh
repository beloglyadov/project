code=$(curl -Is http://192.168.0.21/joomla/ | head -1)

if [[ $code != 'HTTP/1.1 200 OK'* ]]; then
    
    #Останавливаем slave
    mysql -e "STOP SLAVE;"
    #Копируем папку с сайтом на сервер реплики
    sshpass -p 123 scp -r root@192.168.0.21:/var/www/html/joomla ~/
    #Тушим главный сервер, чтобы не мешал
    sshpass -p 123 ssh root@192.168.0.21 shutdown now
    #Дампим БД для передачи на новый master
    mysqldump --all-databases --events --routines --master-data=1 > ~/exam_db_new.sql    
    #Копируем на новый master скрипт для установки и настройки, даём права и запускаем его
    #После перезагрузки выполнить скрипт launch-mon.sh для запуска PROMETHEUS и ELK
    sshpass -p 123 scp -r ~/exam_db_new.sql ~/master-new.sh ~/joomla root@192.168.0.22:~/
    sshpass -p 123 ssh root@192.168.0.22 chmod +rx ~/master-new.sh 
    sshpass -p 123 ssh root@192.168.0.22 ~/master-new.sh 1>~/script_master-new.log 2>~/error_master-new.log
    crontab -r

fi
