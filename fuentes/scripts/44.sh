#!/bin/bash

RESULT=$(find /home -name .netrc | grep -q "."; echo $?)

if [ "$RESULT" -eq "1" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Se encontro archivo .netrc en directorio /home
   else
      echo 1
   fi
fi
