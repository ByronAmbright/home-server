#!/bin/bash

CURRENT_DIR=$(cd "`dirname "$0"`" && pwd)
REPO_ROOT=$(cd "$CURRENT_DIR"/.. && pwd)

echo -e "\nShutting down any running services"

task all-down

echo "Starting Admin Services"

task admin-up

echo "Starting VPN and Services Under VPN by script"

./devops/restart-services-under-vpn.sh

echo "Starting all other services"

task all-up