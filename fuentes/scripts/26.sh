#!/bin/bash

IPV6=$(ip -6 addr | grep inet6)
if [ -n "$IPV6" ]; then
   if [ "$1" == "D" ]; then
      echo IPv6 habilitado: $IPV6
   else
      echo 1
   fi
else
   echo 0
fi
