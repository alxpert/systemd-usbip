#!/bin/bash -e
if [[ -z "${USB_BUS_ID}" ]]; then
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "^busid=${USB_BUS_ID}#" | cut '-d#' -f1 | sed 's/busid=//g'`
else
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
fi
[[ -z "$BUS_ID" ]] || /usr/sbin/usbip bind --$BUS_ID

