#!/bin/bash

hostname=$(hostname)
config="conf/dm-worker.toml"

# we hack here, each dm-worker-<index> connects to mysql-<index>
index=${hostname##*-}
mysql_host=$(grep 'mysql-${index}' $(env MYSQL_IPS) | awk '{print $2}')

# step.1 replace some dynamic variables
sed -i "s/^source-id = .*$/source-id = \"${hostname}\"/" $config
sed -i "s/^host = .*$/host = \"${mysql_host}\"/" $config

# step.2 run DM-worker
./bin/dm-worker -config=$config
