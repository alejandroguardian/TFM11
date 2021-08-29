#!/bin/bash

RESULT1=$(find /usr/share/man -type f ! -perm 644)
RESULT2=$(find /usr/share/doc -type f ! -perm 644)
RET1=0
RET2=0

if [ ! -z "$RESULT1" ]; then
   RET1=1
fi

if [ ! -z "$RESULT2" ]; then
   RET2=1
fi

if [ "$RET1" -eq "0" ] && [ "$RET2" -eq "0" ]; then
   echo 0
else
   if [ "$RET1" -ne "0" ]; then
      if [ "$1" == "D" ]; then
         echo Archivos sin permisos 644 en /usr/share/man: $RESULT1
      else
         echo 1
      fi
   fi

   if [ "$RET2" -ne "0" ]; then
      if [ "$1" == "D" ]; then
         echo Archivos sin permisos 644 en /usr/share/doc: $RESULT2
      else
         echo 1
      fi
   fi
fi
