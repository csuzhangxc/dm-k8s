#!/bin/bash

kubectl create configmap -n dm-test-2-2 mysql-custom-config --from-file=./mysql-custom.cnf
