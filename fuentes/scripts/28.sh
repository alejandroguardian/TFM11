#!/bin/bash

RESULT=$(netstat -lnut| grep -q -E "514|6514"; echo $?)
if [ "$RESULT" -ne "0" ]; then
   if [ "$1" == "D" ]; then
      echo Servicio Syslog habilitado
   else
      echo 1
   fi
else
   echo 0
fi
