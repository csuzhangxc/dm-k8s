#!/bin/bash

function assaemble_config() {
    read -r -d '' line <<- EOF
  -
    source-id: "dm-worker-$1"
    black-white-list:  "instance"
    mydumper-config-name: "global"
    loader-config-name: "global"
    syncer-config-name: "global"

EOF
    printf '  %s\n\n' "$line"
}

for i in $(seq 0 99); do
    assaemble_config $i
done
