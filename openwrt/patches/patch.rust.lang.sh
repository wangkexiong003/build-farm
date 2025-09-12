#!/usr/bin/env bash

OPENWRT_SDK="$1"

RUST_MAKEFILE="${OPENWRT_SDK}/feeds/packages/lang/rust/Makefile"
if [ -f "${RUST_MAKEFILE}" ]; then
  if [ -f ${OPENWRT_SDK}/../.fresh-build ]; then
    echo "+++++ patch file: ${RUST_MAKEFILE} +++++"
    sed -i 's/\(--set=llvm.download-ci-llvm=\)true/\1false/' "${RUST_MAKEFILE}"
  fi
fi
