#!/usr/bin/dumb-init sh

echo before configure
sensuctl configure --non-interactive --url=http://sensu-backend:8080 --username=admin --password=P@ssw0rd! --format=tabular 

echo after configure  

sensuctl handler create sensu-influxdb-handler --command "sensu-influxdb-handler --addr http://influxdb:8086 --username metrics --password metrics --db-name metrics" --type pipe

echo after configure
