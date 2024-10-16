#!/bin/bash -e
if [[ -z "${USB_BUS_ID}" ]]; then
    echo "Using USB_IDVENDOR and USB_IDPRODUCT -> ${USB_IDVENDOR}:${USB_IDPRODUCT}"
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
else
    echo "Using USB_BUS_ID -> ${USB_BUS_ID}"
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "^busid=${USB_BUS_ID}#" | cut '-d#' -f1 | sed 's/busid=//g'`
fi

if [[ -z "${BUS_ID}" ]]; then
    echo "No device found to configure"
    exit 1
fi

/usr/sbin/usbip bind --$BUS_ID

