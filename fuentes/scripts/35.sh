#!/bin/bash

if [ -f /etc/skel/.profile ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo El archivo /etc/skel/.profile no existe
   else
      echo 1
   fi
fi
