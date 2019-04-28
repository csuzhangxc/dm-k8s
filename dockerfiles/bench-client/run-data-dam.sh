#!/bin/bash

hostname=$(hostname)
config="conf/data-dam.toml"

# we hack here, each data-dam-<index> connects to mysql-<index>
index=${hostname##*-}
mysql_host=$(echo $MYSQL_IPS | tr " " "\n" | grep "mysql-${index}," | awk -F ',' '{print $2}')

# step.1 replace some dynamic variables
sed -i "s/^host = .*$/host = \"${mysql_host}\"/" $config
sed -i "s/indexPLC/$index/g" $config

# step.2 run data-dam
./bin/data-dam -config=$config 2>>"./log/data-dam-stderr.log"
