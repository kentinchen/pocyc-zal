ZABBIX_ADDR=192.168.99.6:10051
HOSTS_PATH=/var/lib/ansible/local/k8s/kustomize/zabbix/zal/zal-send.yaml
zal send --log.level=debug --addr="0.0.0.0:9095" --zabbix-addr=$ZABBIX_ADDR --hosts-path=$HOSTS_PATH \
	    --key-prefix="prometheus" --default-host="prometheus" &
