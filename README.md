## nut-upsd

The Network UPS Tools (nut) package in an Alpine container, with enough configuration to support Nagios monitoring of your UPS units. This multi-architecture image supports Intel/AMD and ARM (Raspberry Pi etc).

### Usage

As a read-only service intended for monitoring, this container makes no attempt to lock down network security.

Verified with the most-common type of UPS, the APC consumer-grade product; Tripp Lite models also (probably) work. Note that the usbhid-ups driver for APC requires you to provide the correct 12-digit hardware serial number. All other parameter defaults will work.

If you have a different model of UPS, contents of the files ups.conf, upsd.conf, upsmon.conf, and/or upsd.users can be overridden by mounting them to /etc/nut/local.

If you have more than one UPS connected to a host, run more than one copy of this container and bind the container port 3493 from each to a separate TCP port.

