#!/bin/bash

kubectl create configmap -n dm-test-3 mysql-custom-config --from-file=./mysql-custom.cnf
