#!/bin/bash

RET=0
if [ -f /root/.bash_profile ]; then

   RESULT=$(ls -la /root/.bash_profile | awk '{ print $1}')
   if [ "$RESULT" != "-rw-r-----" ]; then
      RET=1
      if [ "$1" == "D" ]; then
         echo El archivo /root/.bash_profile no tiene permisos 640
      else
         echo 1
      fi
   fi

   RESULT1=$(ls -la /root/.bash_profile | awk '{ print $3}')
   if [ "$RESULT1" != "root" ]; then
      RET=1
      if [ "$1" == "D" ]; then
         echo El archivo /root/.bash_profile no tiene como propietario a root: $RESULT1
      else
         echo 1
      fi
   fi

   RESULT2=$(ls -la /root/.bash_profile | awk '{ print $4}')
   if [ "$RESULT2" != "root" ]; then
      RET=1
      if [ "$1" == "D" ]; then
         echo El archivo /root/.bash_profile no tiene como grupo a root: $RESULT2
      else
         echo 1
      fi
   fi
   
fi

# Final
if [ "$RET" -eq "0" ]; then
   echo 0
fi
