#!/bin/bash

if [ "$1" == "D" ]; then
   for dir in $(ls /home)
   do
      echo find /home/$dir/ -maxdepth 1 -mindepth 1 -type f -exec grep -qi "xhost +" {} \;
   done
else
   for dir in $(ls /home)
   do
      echo find /home/$dir/ -maxdepth 1 -mindepth 1 -type f -exec grep -qi "xhost +" {} \;
   done
fi
