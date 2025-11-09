#!/usr/bin/env bash

OPENWRT_SDK="$1"

## hello world requires dnsmasq-full
#
if [ -d "${OPENWRT_SDK}/../ipks_built" ]; then
  find "${OPENWRT_SDK}/bin/packages/" -type f -name "dnsmasq-full*.ipk" -exec cp -v {} "${OPENWRT_SDK}/../ipks_built/" \;
fi
