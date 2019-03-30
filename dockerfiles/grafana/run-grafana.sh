#!/bin/bash

home="/home/tidb"
config="$home/opt/grafana/conf/grafana.ini"
ipaddr=$(ip addr | grep "inet" | grep -v "127.0.0.1" | awk '{print $2}' | awk -F'/' '{print $1}')

# step.1 replace some dynamic variables
sed -i "s/^domain = .*$/domain = ${ipaddr}/" $config

echo "{
    "name":"dm-test-cluster",
    "type":"prometheus",
    "access":"proxy",
    "url":"http://${PROMETHEUS_IP}:9090/",
    "basicAuth":false
}" > $home/data.grafana/data_source.json

# step.2 run grafana
LANG=en_US.UTF-8 opt/grafana/bin/grafana-server \
    --homepath="$home/opt/grafana" \
    --config="$home/opt/grafana/conf/grafana.ini"
