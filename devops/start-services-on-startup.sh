#!/bin/bash

CURRENT_DIR=$(cd "`dirname "$0"`" && pwd)
REPO_ROOT=$(cd "$CURRENT_DIR"/.. && pwd)

services_to_stop=()
services_to_stop+=("actual")
services_to_stop+=("calibre")
services_to_stop+=("calibre-web")
services_to_stop+=("fireflyiii")
services_to_stop+=("minecraft")

cd $REPO_ROOT
echo -e "\nREPO_ROOT: $REPO_ROOT"
echo -e "\nCURRENT_DIR: $CURRENT_DIR"
echo -e "\ndirname: $dirname"


./devops/start-all-services.sh

echo -e "\nShutting down any services not meant to be started at startup"

for service in "${services_to_stop[@]}"; do
    make_down_command="$service-down"
    make $make_down_command
done