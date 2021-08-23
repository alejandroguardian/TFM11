#!/bin/bash

PASE=0
if [ ! -f /var/log/wtmp ]; then
   PASE=1
   if [ "$1" == "D" ]; then
      echo El archivo /var/log/wtmp no se encuentra
   else
      echo 1
   fi
elif [ ! -f /var/run/utmp ]; then
   PASE=1
   if [ "$1" == "D" ]; then
      echo El archivo /var/run/utmp no se encuentra
   else
      echo 1
   fi
fi

# No existe algun archivo de los anteriores
if [ "$PASE" -eq "1" ]; then
   echo 1
fi

# Sigo
SALIDA=0
while read -r permisos 
do
   if [ "$permisos" == "-r--------" ]; then
      SALIDA=0
   else
      if [ "$1" == "D" ]; then
         SALIDA="Permisos de archivo /var/log/wtmp no son 600"
      else
         SALIDA=1
      fi
   fi
done < <(ls -l /var/run/utmp | awk '{ print $1 }')
 
# Permisos utmp
while read -r permisos 
do
   if [ "$permisos" == "-r--------" ]; then
      SALIDA=0
   else
      if [ "$1" == "D" ]; then
         SAL="$SALIDA -  Permisos de archivo /var/run/utmp no son 600"
	 SALIDA=$SAL
      else
         SALIDA=1
      fi
   fi
done < <(ls -l /var/run/utmp | awk '{ print $1 }')
  
echo $SALIDA 
