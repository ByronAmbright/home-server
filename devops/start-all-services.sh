#!/bin/bash

CURRENT_DIR=$(cd "`dirname "$0"`" && pwd)
REPO_ROOT=$(cd "$CURRENT_DIR"/.. && pwd)

echo -e "\nShutting down any running services"

make all-down

echo "Starting Admin Services"

make admin-up

echo "Starting VPN and Services Under VPN by script"

./devops/restart-services-under-vpn.sh

echo "Starting all other services"

make all-up