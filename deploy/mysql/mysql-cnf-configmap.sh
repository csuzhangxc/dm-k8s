#!/bin/bash

kubectl create configmap -n dm-test-4 mysql-custom-config --from-file=./mysql-custom.cnf
