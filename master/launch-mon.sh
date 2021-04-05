##Запуск контейнеров Prometheus, Node_exporter, cAdvisor, Grafana 
cd /tmp/project/prom-grafana
docker-compose up -d

#Устанавливаем и запускаем Filebeat локально
cd /tmp/project/elk-filebeat
mv -f ./filebeat.yml /etc/filebeat/
systemctl restart filebeat
docker-compose up -d
sleep 120
filebeat setup
