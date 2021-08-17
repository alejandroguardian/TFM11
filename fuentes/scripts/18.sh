#!/bin/bash

if [ -f /var/log/lastlog ]; then
   echo 0
else
   if [ "$1" != "D" ]; then
      echo 1
   else
      echo No existe archivo /var/log/lastlog
   fi
fi
