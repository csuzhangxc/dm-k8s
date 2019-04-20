#!/bin/bash

kubectl get pods -n dm-test-2 -o wide|grep prometheus|awk '{print $1","$6}' > PROMETHEUS_IP.tmp
kubectl delete configmap -n dm-test-2 prometheus-ip-config || true
kubectl create configmap -n dm-test-2 prometheus-ip-config --from-file=PROMETHEUS_IP=./PROMETHEUS_IP.tmp
rm PROMETHEUS_IP.tmp
