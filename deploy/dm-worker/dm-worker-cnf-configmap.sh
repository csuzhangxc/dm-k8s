#!/bin/bash

# This script is used for re-generate DM-worker deployment configmap

CONFIG_NAME="dm-worker-config"
CONFIG_KEY="DM_WORKERS"

default_port=8262

kubectl get pods -n dm-test-3 -o wide | grep dm-worker | awk -v port="$default_port" '{ print $1 "," $6 "," port }' > $CONFIG_NAME.tmp

kubectl delete configmap -n dm-test-3 $CONFIG_NAME || true
kubectl create configmap -n dm-test-3 $CONFIG_NAME --from-file=$CONFIG_KEY=./$CONFIG_NAME.tmp
rm $CONFIG_NAME.tmp
