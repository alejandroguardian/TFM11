#!/bin/bash

RESULT=$(ls /lost+found/ | wc -l)
if [ "$RESULT" -eq "0" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Directorio lost+found no esta vacio
   else
      echo 1
   fi
fi
