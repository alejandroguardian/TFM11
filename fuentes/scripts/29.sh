#!/bin/bash


RESULT=0
if [ -d /etc/security/console.perms.d ]; then
   RESULT=1
   EXISTE=$(grep -q -E "fd|floppy|cdrom|cdwriter" /etc/security/console.perms.d/*; echo $?)
   if [ "$EXISTE" -eq "0" ]; then
      if [ "$1" == "D" ]; then
         echo Unidades removibles permitidas Floppy-Cd
      else
         echo 1
      fi
   else
      echo 0
   fi
elif [ -f /etc/security/console.perms ]; then
   RESULT=1
   EXISTE=$(grep -q -E "fd|floppy|cdrom|cdwriter" /etc/security/console.perms; echo $?)
   if [ "$EXISTE" -eq "0" ]; then
      if [ "$1" == "D" ]; then
         echo Unidades removibles permitidas Floppy-Cd
      else
         echo 1
      fi
   else
      echo 0
   fi
fi

# No hay nada, devuelvo 0
if [ "$RESULT" -eq "0" ]; then
   echo 0
fi

