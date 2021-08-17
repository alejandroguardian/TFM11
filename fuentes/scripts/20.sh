#!/bin/bash

while read -r line ; do
   OK=$(echo $line | grep -q nosuid; echo $?)
   if [ "$OK" -eq "0" ]; then
      echo 0
   else
      if [ "$1" != "D" ]; then
         echo 1
      else
         echo No existe nosuid para montajes NFS
      fi
   fi
done < <(grep nfs /etc/fstab | tr -d '/' | tr -d '<' | tr -d '>')
