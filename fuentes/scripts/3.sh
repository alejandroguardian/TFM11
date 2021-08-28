#!/bin/bash

if [ ! -f /etc/ssh/sshd_config ]; then
   if [ "$1" == "D" ]; then
      echo No existe el archivo /etc/ssh/sshd_config
   else
      echo 1
   fi
else
   RESULT=$(grep -q "PermitRootLogin yes" /etc/ssh/sshd_config ; echo $?)
   if [ "$RESULT" -eq "1" ]; then
      echo 0
   else
      if [ "$1" == "D" ]; then
         echo Root tiene permiso de acceso mediante SSH
      else
         echo 1

      fi
   fi
fi
