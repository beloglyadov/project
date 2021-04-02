code=$(curl -Is http://192.168.0.21/joomla/ | head -1)

if [[ $code != 'HTTP/1.1 200 OK'* ]]; then
    
    #Тушим главный сервер, чтобы не мешал
    sshpass -p 123 ssh root@192.168.0.21 shutdown now
    #Дампим БД для передачи на новый master
    mysqldump --all-databases --events --routines --master-data=1 > ~/exam_db_new.sql
    #Останавливаем slave
    mysql -e "STOP SLAVE;"
    #Копируем на новый master скрипт для установки и настройки, даём права и запускаем его
    #После перезагрузки выполнить скрипт launch-mon.sh для запуска PROMETHEUS и ELK
    sshpass -p 123 scp ~/exam_db_new.sql ~/master-new.sh root@192.168.0.22:~/
    sshpass -p 123 ssh root@192.168.0.22 chmod +rx ~/master-new.sh 
    sshpass -p 123 ssh root@192.168.0.22 ~/master-new.sh 1>script.log 2>~/error.log
    crontab -r

fi
