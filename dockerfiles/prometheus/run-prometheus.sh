#!/bin/bash

home="/home/tidb"
config="conf/prometheus.yml"
default_port=8262

# step.1 replace some dynamic variables
for ip in $(echo $MYSQL_IPS | tr " " "\n"|awk -F, '{print $2}'); do
    echo "      - '$ip:$default_port'" >> $config
done

# step.2 run prometheus
./bin/prometheus \
    --config.file="$config" \
    --web.listen-address=":9090" \
    --web.external-url="http://0.0.0.0:9090/" \
    --web.enable-admin-api \
    --log.level="info" \
    --storage.tsdb.path="$home/data/prometheus.data.metrics" \
    --storage.tsdb.retention="15d"
