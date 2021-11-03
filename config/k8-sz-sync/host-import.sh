#!/bin/bash

ZABBIX_USER=Admin
ZABBIX_PASSWORD=Chen7911
PROMETHEUS_URL=localhost:9090
ZABBIX_URL=192.168.99.234:8080

for area in 'sz' ;
do
     for app in 'chia' 'fic-worker' 'fic-miner' 'fil-miner' 'fil-worker' ;
     do
          ../../zal prov --log.level=debug --config-path=$area-$app-hosts.cfg \
                 --url=http://$ZABBIX_URL/api_jsonrpc.php --user=$ZABBIX_USER --password=$ZABBIX_PASSWORD \
                 --prometheus-url=http://$PROMETHEUS_URL
     done
done
