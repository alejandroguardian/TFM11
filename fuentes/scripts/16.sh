#!/bin/bash

RUTA=$(echo $PATH) 
IFS=":" read -a arrruta <<< $RUTA
flag=0
for i in "${arrruta[@]}"
do
   if [ "$i" == "." ] || [ "$i" == "./" ]; then
      flag=1
   fi
done 

if [ "$1" != "D" ]; then
   echo $flag
else
   echo El directorio actual existe en el PATH
fi
