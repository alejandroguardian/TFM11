#!/bin/bash

RH=$(find /home/ -name .rhosts)
if [ -n "$RH" ]; then
   PASE=1
   if [ "$1" == "D" ]; then
      echo Archivo .rhosts detectado: $RH
   else
      echo 1
   fi
else
   echo 0
fi
