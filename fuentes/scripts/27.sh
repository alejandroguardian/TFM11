#!/bin/bash

if [ -f /var/log/auth.log ]; then
 while read -r permisos usuario grupo
   do
      if [ "$permisos" == "-r--------" ] && [ "$usuario" == "root" ] && [ "$grupo" == "root" ]; then
         echo 0
      else
         if [ "$1" == "D" ]; then
            echo Permisos de archivo /var/log/auth.log incorrectos
         else
            echo 1
         fi
      fi
   done < <(ls -l /var/log/auth.log | awk '{ print $1,$3,$4 }')
elif [ -f /var/log/secure ]; then
 while read -r permisos usuario grupo
   do
      if [ "$permisos" == "-r--------" ] && [ "$usuario" == "root" ] && [ "$grupo" == "root" ]; then
         echo 0
      else
         if [ "$1" == "D" ]; then
            echo Permisos de archivo /var/log/secure incorrectos
         else
            echo 1
         fi
      fi
   done < <(ls -l /var/log/secure | awk '{ print $1,$3,$4 }')
else
   if [ "$1" == "D" ]; then
      echo No existen archivos de registro de acceso auth.log o secure
   else
      echo 1
   fi
fi
