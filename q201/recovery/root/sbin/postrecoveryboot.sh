#!/sbin/sh
if [ -z $(lsmod | grep "dwc") ]; then
  insmod /boot/dwc3.ko
  insmod /boot/dwc_otg.ko
fi
