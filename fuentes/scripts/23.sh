#!/bin/bash

PASE=0
if [ -f /etc/exports ]; then
   PASE=1
   NOROOTSQUASH=$(grep -q no_root_squash /etc/exports; echo $?)
   NOACL=$(grep -q no_acl /etc/exports; echo $?)
   ANONUID=$(grep -q anonuid /etc/exports; echo $?)
   #ROOT=$(grep -q no_root_squash /etc/exports; echo $?)
   if [ "$NOROOTSQUASH" -eq "1" ] && [ "$NOACL" -eq "1" ] && [ "$ANONUID" -eq "1" ]; then
      echo 0
   else
      if [ "$1" == "D" ]; then
         echo Los servicios exportados mediante NFS son inseguros
      else
	 echo 1
      fi
   fi
fi

if [ "$PASE" -eq "0" ]; then
   echo $PASE
fi
