#!/bin/bash

PASE=0
while read -r line ; do
   OKNS=$(echo $line | grep -q nosuid; echo $?)
   OKND=$(echo $line | grep -q nodev; echo $?)
   PASE=1
   if [ "$OKNS" -eq "0" ] && [ "$OKND" -eq "0" ]; then
      echo 0
   else
      if [ "$1" != "D" ]; then
         echo 1
      else
         echo Montaje Homes contiene nosuid o nodeb
      fi
   fi
done < <(grep home /etc/fstab | tr -d '/' | tr -d '<' | tr -d '>')

if [ "$PASE" -eq "0" ]; then
   echo 0
fi
