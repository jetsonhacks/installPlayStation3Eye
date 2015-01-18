#!/bin/sh
# Build Sony PlayStation 3 Eye drivers for LT4 21.2 on the NVIDIA Jetson TK1
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   echo "$ sudo "$0""
   exit
fi

# Before running this script, you should have used
# $ menu menuconfig
# to select the driver for the particular device(s) you are building
# Navigate to:
# Device Drivers->Multimedia Support->Media USB Adapters->GSPCA based Webcams
# In this case OV534 OV772x USB Camera Driver, and Modularize
# Save the configuration then:
cd /usr/src/kernel
make prepare
make modules_prepare
make modules SUBDIRS=drivers/media/usb/gspca

# You'll need to copy the newly built driver
cp /usr/src/kernel/drivers/media/video/gspca/gspca_ov534.ko /lib/modules/$(uname-r)/kernel/drivers/media/usb/gspca/

