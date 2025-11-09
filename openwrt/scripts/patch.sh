#!/usr/bin/env bash

OPENWRT_SDK="$1"

## remove identation checking for openappfilter
#
OAF_MAKEFILE="${OPENWRT_SDK}/feeds/openappfilter/oaf/Makefile"
if [ -f "${OAF_MAKEFILE}" ]; then
  echo "+++++ patch file: ${OAF_MAKEFILE}"
  sed -i '/^EXTRA_CFLAGS:=/ s|$| -Wno-misleading-indentation|' "${OAF_MAKEFILE}"
fi

## disable llvm download for rust.
## if restore from cache, never change it which will trigger rebuild again..
#
RUST_MAKEFILE="${OPENWRT_SDK}/feeds/packages/lang/rust/Makefile"
if [ -f "${RUST_MAKEFILE}" ]; then
  if [ -f ${OPENWRT_SDK}/../.fresh-build ]; then
    echo "+++++ patch file: ${RUST_MAKEFILE} +++++"
    sed -i 's/\(--set=llvm.download-ci-llvm=\)true/\1false/' "${RUST_MAKEFILE}"
  fi
fi
