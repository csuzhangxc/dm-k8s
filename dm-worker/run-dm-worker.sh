#!/bin/sh
# step.1 replace `source-id` with `${HOSTNAME}`

# step.2 wait MySQL can accept connection

# step.3 run DM-worker
./dm-worker -config=dm-worker.toml
