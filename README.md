# Systemd unit for automounting usb devices over usbip

This is shamelessly ripped from [larsks sysetemd-usb-gadget][https://github.com/larsks/systemd-usb-gadget]

## Installation

To install the systemd unit, run `make install` in the source
directory, which will place the support scripts into `/sbin` and the
systemd unit into `/etc/systemd/system`.

## Configuration

Create one or files in `/etc/usbip-devices` named `<device_name>.conf`.
These files **must** contain either one of the following configuration keys:


- `USB_IDVENDOR` -- Vendor ID. 
- `USB_IDPRODUCT` -- Product ID. 

or

- `USB_BUS_ID` -- to bind toa specific USB port

For example, to share a device with vendor:product 03f0:8607, create a file
called /etc/usbip_devices/mouse.conf

    USB_IDVENDOR=03f0
    USB_IDPRODUCT=8607

or

    USB_BUS_ID=1-1.1.4

To enable the device at boot, run:

    systemctl enable usbip-device@mouse

To share the device immediately:

    systemctl start usbip-device@mouse

To stop sharing it:

    systemctl stop usbip-device@mouse
