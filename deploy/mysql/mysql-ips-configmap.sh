#!/bin/bash

kubectl get pods -n dm-test -o wide|grep mysql|awk '{print $1, $6}' > MYSQL_IPS.tmp
kubectl delete configmap -n dm-test mysql-ips-config || true
kubectl create configmap -n dm-test mysql-ips-config --from-file=MYSQL_IPS=./MYSQL_IPS.tmp
