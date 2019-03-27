#!/bin/sh
# step.1 replace `source-id` with `${HOSTNAME}`

# step.2 run DM-worker
./dm-worker -config=dm-worker.toml
