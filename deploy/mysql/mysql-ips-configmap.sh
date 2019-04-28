#!/bin/bash

kubectl get pods -n dm-test-3 -o wide|grep mysql|awk '{print $1","$6}' > MYSQL_IPS.tmp
kubectl delete configmap -n dm-test-3 mysql-ips-config || true
kubectl create configmap -n dm-test-3 mysql-ips-config --from-file=MYSQL_IPS=./MYSQL_IPS.tmp
rm MYSQL_IPS.tmp
