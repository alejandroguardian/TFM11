#!/bin/bash

PASE=0
if [ -f /etc/cups/cupsd.conf ]; then
   PASE=1
   while read -r permisos usuario grupo
   do
      if [ "$permisos" == "-r--------" ] && [ "$usuario" == "lp" ] && [ "$grupo" == "sys" ]; then
         echo 0
      else
         if [ "$1" == "D" ]; then
            echo Permisos de archivo cupsd.conf incorrecto
         else
            echo 1
         fi
      fi
   done < <(ls -l /etc/cups/cupsd.conf | awk '{ print $1,$3,$4 }')
fi

if [ "$PASE" -eq "0" ]; then
   echo $PASE
fi
