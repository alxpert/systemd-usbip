#!/bin/sh
if [[ -z "${USB_BUS_ID}" ]]; then
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
else
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "^busid=${USB_BUS_ID}#" | cut '-d#' -f1 | sed 's/busid=//g'`
fi

if [[ -z "${BUS_ID}" ]]; then
    echo "No device found to remove"
    exit 1
fi

/usr/sbin/usbip unbind --$BUS_ID