#!/bin/bash

for i in $(seq 0 49); do
    sed "s/INDEX/$i/g" task.yaml > task_$i.yaml
done
