#!/bin/bash

SALIDA=0
SALIDAFULL="0"

if [ "$1" == "D" ]; then
   for u in $(passwd -Sa | awk '$2 == "P" {print $1}')
   do
      ID=$(cat /etc/passwd | grep $u |  awk -F: '{ print $3 }')
      if [ "$ID" -lt "500" ]; then
         STAT=$(passwd -S $u | awk '{ print $2 }')
         if [ "$STAT" != "L" ]; then
           SALIDAFULL+=$u","
         fi
      fi
   done
   echo $SALIDAFULL
else
   for u in $(passwd -Sa | awk '$2 == "P" {print $1}')
   do
      ID=$(cat /etc/passwd | grep $u |  awk -F: '{ print $3 }')
      if [ "$ID" -lt "500" ]; then
         STAT=$(passwd -S $u | awk '{ print $2 }')
	 if [ "$STAT" != "L" ]; then
	   SALIDA=$((SALIDA + 1))
         fi
      fi  
   done
   echo $SALIDA
fi
