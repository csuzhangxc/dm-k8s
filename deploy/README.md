# Simple DM Test Environment k8s YAML Deployment

## Run a DM cluster step by step

0. first build docker images, including `hub.pingcap.net/dm/dm-worker:v1.0.0` and `hub.pingcap.net/dm/dm-master:v1.0.0`
1. add mysql custom to configmap by running `deploy/mysql/mysql-cnf-configmap.sh`
2. setup mysql clusters by running `kubectl apply -f deploy/mysql/mysql.yaml`
3. add mysql ips information to configmap by running `deploy/mysql/mysql-ips-configmap.sh`
4. setup DM-workers by running `kubectl apply -f deploy/dm-worker/dm-worker.yaml`
5. add DM-workers information to configmap by running `deploy/dm-worker/dm-worker-cnf-configmap.sh`
6. setup DM-master by running `kubectl apply -f deploy/dm-master/dm-master.yaml`

## Regulation

* default namespace is `dm-test-3`
