#!/bin/bash

RESULT=$(find /home -name .forward | grep -q "."; echo $?)
if [ "$RESULT" -eq "1" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      Se encontro archivo .forward en /home de usuario
   else
      1
   fi
fi
