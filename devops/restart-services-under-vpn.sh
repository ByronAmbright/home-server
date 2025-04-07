#!/bin/bash

CURRENT_DIR=$(cd "`dirname "$0"`" && pwd)
REPO_ROOT=$(cd "$CURRENT_DIR"/.. && pwd)

GLUETUN_READY_LOG="INFO \[ip getter\] Public IP address is"
GLUETUN_LOGS_FILE_NAME="gluetun-docker-output.log"

echo -e "\nShutting down vpn and services under it"

make services-under-vpn-down
make vpn-down

echo "Starting VPN"

make vpn-up

echo "Waiting for gluetun to be ready:"

while :; do

    docker container logs gluetun > $GLUETUN_LOGS_FILE_NAME

    if [ $? -eq 1 ]; then
        echo "bad: $DOCKER_LOG_OUTPUT"
        sleep 1
        continue
    fi

    GREP_FOR_STRING=$(grep -m 1 "$GLUETUN_READY_LOG" $GLUETUN_LOGS_FILE_NAME)

    if [[ $GREP_FOR_STRING != "" ]]; then
        echo "Gluetun is ready with ip info:"
        echo "$GREP_FOR_STRING"
        rm -f ${GLUETUN_LOGS_FILE_NAME}
       break;
    fi

    sleep 1
done

echo "Starting Services Under VPN"

make services-under-vpn-up