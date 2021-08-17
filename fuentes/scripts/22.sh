#!/bin/bash

USBDISABLED=$(grep -q usb-storage /etc/modprobe.d/*; echo $?)
if [ "$USBDISABLED" -eq "0" ]; then
   echo 0
else
   if [ "$1" != "D" ]; then
      echo 1
   else
      echo Dispositivos de almacenamiento USB permitidos
   fi
fi
