#!/bin/bash

if [ "$1" != "D" ]; then
   if [ -f /etc/hosts.equiv ]; then
      echo 1
   else
      echo 0
   fi
else
   if [ -f /etc/hosts.equiv ]; then
      echo El archivo /etc/hosts.equiv existe
   else
      echo 0
   fi
fi
