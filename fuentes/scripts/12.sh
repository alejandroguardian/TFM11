#!/bin/bash

RESULT=$(find /home -maxdepth 2 -name ".exrc" -print | xargs grep -q "!"; echo $?)
if [ "$RESULT" -eq "0" ]; then
   if [ "$1" == "D" ]; then
      echo Se encontro archivo .exrc con caracter !
   else
      echo 1
   fi
else
   echo 0
fi
