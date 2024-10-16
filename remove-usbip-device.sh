#!/bin/bash -e

if [[ -z "${USB_BUS_ID}" ]]; then
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
else
    BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "^busid=${USB_BUS_ID}#" | cut '-d#' -f1`
fi

if [[ -z "${BUS_ID}" ]]; then
    echo "No device found to remove"
    exit 1
fi

UDEV_RULES_FILE="/etc/udev/rules.d/99-$1.rules"
rm -rf $UDEV_RULES_FILE

udevadm control --reload-rules
udevadm trigger

/usr/sbin/usbip unbind --$BUS_ID

