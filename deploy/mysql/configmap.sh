#!/bin/bash

kubectl create configmap -n dm-test mysql-custom-config --from-file=./mysql-custom.cnf
