#!/usr/bin/dumb-init sh

sensuctl configure --non-interactive --url=http://sensu-backend:8080 --username=admin --password=P@ssw0rd! --format=tabular 

sensuctl user change-password admin --current-password=P@ssw0rd! --new-password $1

sensuctl handler create sensu-influxdb-handler --command "sensu-influxdb-handler --addr http://influxdb:8086 --username metrics --password $2 --db-name metrics" --type pipe