#!/bin/bash

export DM_WORKERS="dm-worker-0,10.233.99.202,8262 dm-worker-1,10.233.122.136,8262"
for line in $DM_WORKERS; do
    echo "[[deploy]]"
    echo $line | awk -F ',' '{print "source_id = \"" $1 "\"\ndm-worker = \"" $2 ":" $3 "\"\n"}'
done

