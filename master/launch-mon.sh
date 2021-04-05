##Запуск контейнеров Prometheus, Node_exporter, cAdvisor, Grafana 
cd /tmp/project/prom-grafana
docker-compose up -d

#Устанавливаем и запускаем Filebeat локально
cd /tmp/project/elk-filebeat
mv -f ./filebeat.yml /etc/filebeat/
filebeat modules enable apache
systemctl restart filebeat
docker-compose up -d
sleep 100
filebeat setup
