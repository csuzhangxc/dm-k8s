#!/bin/bash

hostname=$(hostname)
config="conf/dm-master.toml"

# step.1 add DM-worker deployment config
for line in $DM_WORKERS; do
    echo "[[deploy]]" >> $config
    echo $line | awk -F ',' '{print "source-id = \"" $1 "\"\ndm-worker = \"" $2 ":" $3 "\"\n"}' >> $config
done

# step.2 run DM-master
./bin/dm-master -config=$config 2>>"./log/dm-master-stderr.log"
