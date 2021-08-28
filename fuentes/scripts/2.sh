#!/bin/bash

if [ ! -f /etc/securetty ]; then
   if [ "$1" == "D" ]; then
      echo No existe el archivo /etc/securetty
   else
      echo 1
   fi
else
   RESULT=$(cat /etc/securetty | grep -q 'pts\|vc' ; echo $?)
   if [ "$RESULT" -eq "1" ]; then
      echo 0
   else
      if [ "$1" == "D" ]; then
         echo Root puede acceder remotamente al servidor
      else
         echo 1

      fi
   fi
fi
