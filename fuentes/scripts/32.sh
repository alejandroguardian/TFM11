#!/bin/bash

RESULT=$(cat /etc/passwd| awk -F: 'NF!=7 { print $0 }')
if [ "$RESULT" == "" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Archivo passwd incorrectamente formateado
   else
      echo 1
   fi
fi
