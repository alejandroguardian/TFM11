#!/bin/bash

RESULT=$(grep -q password /boot/grub/grub.cfg; echo $?)
if [ "$RESULT" -eq "0" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Grub no esta protegido con contraseña
   else
      echo 1
   fi
fi

# No hay nada, devuelvo 0
if [ "$RESULT" -eq "0" ]; then
   echo 0
fi

