#!/bin/bash

ip=$(kubectl get pods -n dm-test-3 -o wide|grep mysql|awk '{print $6}')
for i in $(seq 0 49); do
    echo "mysql-$i,$ip" >> MYSQL_IPS.tmp
done
kubectl delete configmap -n dm-test-3 mysql-ips-config || true
kubectl create configmap -n dm-test-3 mysql-ips-config --from-file=MYSQL_IPS=./MYSQL_IPS.tmp
rm MYSQL_IPS.tmp
