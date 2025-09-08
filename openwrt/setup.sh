#!/usr/bin/env bash

OPENWRT_SDK="$1"
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for SCRIPT in "${SCRIPTS_DIR}/patches/patch*.sh"; do
  echo "+++++ process ${SCRIPT}..."
  bash ${SCRIPT} ${OPENWRT_SDK}
done
