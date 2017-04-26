#!/sbin/sh
if [ -z $(lsmod | grep "dwc") ]; then
  insmod /boot/aml_nftl_dev.ko
  insmod /boot/dwc_otg.ko
fi
