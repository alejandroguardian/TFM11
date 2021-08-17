#!/bin/bash

EXISTEPPP=$(ip link | grep ppp; echo $?)
if [ "$1" != "D" ]; then
   if [ "$EXISTEPPP" == "0" ]; then
      echo 1
   else
      echo 0
   fi
else
   if [ "$EXISTEPPP" == "0" ]; then
      echo Existen interfaces PPP
   else
      echo 0
   fi
fi
