#!/bin/bash

RESULT=$(ss -ln4 | grep -v State | awk '{ print $5}')

if [ -z "$RESULT" ]; then
   echo 0
else 
   if [ "$1" == "D" ]; then
      echo Se encontraron los siguientes servicios: $RESULT
   else
      echo 1
   fi
fi
