#!/bin/bash

mysql_host=${1:-127.0.0.1}
mysql_port=${2:-3306}
mysql_user=${3:-root}
hostname=$(hostname)
config="conf/dm-worker.toml"

# step.1 replace some dynamic variables
sed -i "s/^source-id = .*$/source-id = \"${hostname}\"/" $config
sed -i "s/^host = .*$/host = \"${mysql_host}\"/" $config
sed -i "s/^port = .*$/port = ${mysql_port}/" $config
sed -i "s/^user = .*$/user = \"${mysql_user}\"/" $config
if [ "$#" -ge 4 ]; then
    sed -i "s/^password = .*$/password = \"${4}\"/" $config
fi

# step.2 run DM-worker
./bin/dm-worker -config=$config
