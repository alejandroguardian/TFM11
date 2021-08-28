#!/bin/bash

RESULT=$(cat /etc/passwd | grep :0: | wc -l)
if [ "$RESULT" -eq "1" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      RESULT=$(cat /etc/passwd | grep :0:)
      echo $RESULT
   else
      echo 1
   fi
fi
