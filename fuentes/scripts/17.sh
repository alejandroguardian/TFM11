#!/bin/bash

if [ -f /etc/profile ]; then
   TMOUT1=$(grep tmout /etc/profile; echo $?) #Debe devolver 1
   if [ "$TMOUT1" -eq "0" ]; then
      echo 0
   else
      if [ "$1" != "D" ]; then
         echo 1
      else
         echo No existe variable tmout en /etc/profile o /etc/csh.cshrc
      fi
   fi
fi

