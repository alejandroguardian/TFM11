#!/bin/bash

RESULT1=$(grep -q "authpriv.*" /etc/rsyslogd.conf 2>/dev/null; echo $?)
RET1=0
RESULT2=$(grep -q "authpriv.*" /etc/rsyslog.d/* 2>/dev/null; echo $?)
RET2=0

if [ "$RESULT1" -ne "0" ]; then
   RET1=1
fi

if [ "$RESULT2" -ne "0" ]; then
   RET2=1
fi

if [ "$RET1" -eq "0" ] || [ "$RET2" -eq "0" ]; then
   echo 0
else
   if [ "$RET1" -ne "0" ]; then
      if [ "$1" == "D" ]; then
         echo No se encontro el valor authpriv.* en /etc/rsyslogd.conf
      else
	 echo 1
      fi
   elif [ "$RET2" -ne "0" ]; then
      if [ "$1" == "D" ]; then
         echo No se encontro el valor authpriv.* en /etc/rsyslog.d/
      else
         echo 1
      fi
   fi
fi
