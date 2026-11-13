#!/usr/bin/env bash
# Prints the unique volume names declared in the top-level `volumes:` section
# of every docker/*/docker-compose.yml, one per line.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

awk '
  /^[^[:space:]#]/ { in_volumes = ($0 ~ /^volumes:/); next }
  in_volumes && /^[[:space:]]+[A-Za-z0-9_.-]+:[[:space:]]*(#.*)?$/ {
    name = $1; sub(/:$/, "", name); print name
  }
' "$root"/docker/*/docker-compose.yml | sort -u
