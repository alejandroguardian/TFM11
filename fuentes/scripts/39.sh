#!/bin/bash

RESULTINIT=$(ss -ln4 | grep -v State | awk '{ print $5}')
RESULTSYSTEM=$(find /etc/systemd)

if [ -d /etc/init.d ]; then
   RESULTINIT=$(find /etc/init.d ! -user root)
fi

if [ -d /etc/systemd ]; then   
   RESULTSYSTEM=$(find /etc/systemd/ ! -user root)
fi

if [ -z "$RESULTINIT" ] && [ -z "$RESULTSYSTEM" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      if [ ! -z "$RESULTINIT" ]; then
         echo Se encontraron archivos con owner distinto a root en /etc/init.d: $RESULTINIT
      else 
          echo Se encontraron archivos con owner distinto a root en /etc/systemd: $RESULTSYSTEM
      fi
   else
      echo 1
   fi
fi
