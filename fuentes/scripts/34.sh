#!/bin/bash

RESULT=0

for i in $(cat /etc/passwd | awk -F: '{ print $7}' | awk -F"/" '{print NF-1}')
do
   if [ "$i" -lt "2" ]; then 
      RESULT=1
   fi
done

if [ "$RESULT" -eq "0" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Algunas entradas de /etc/passwd no contienen login shell con PATH absoluto
   else
      echo 1
   fi
fi
