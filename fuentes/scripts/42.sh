#!/bin/bash

RESULT=$(ls -ld /root | awk '{ print $4 }')

if [ "$RESULT" == "root" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo El grupo dueño de /root es $RESULT
   else
      echo 1
   fi
fi
