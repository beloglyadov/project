##Запуск контейнеров Prometheus, Node_exporter, cAdvisor, Grafana 
cd /tmp/project/prom-grafana
docker-compose up -d

#Устанавливаем и запускаем Filebeat локально
cd /tmp/project/elk-filebeat
docker-compose up -d
filebeat setup
