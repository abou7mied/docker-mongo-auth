#!/bin/bash
set -m

MONGODB_ARGS = ${MONGODB_ARGS:-""}
mongodb_cmd="mongod ${MONGODB_ARGS}"
cmd="$mongodb_cmd"

if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

$cmd &

if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi

fg