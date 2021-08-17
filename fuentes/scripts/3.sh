#!/bin/bash

if [ "$1" == "D" ]; then
   grep "PermitRootLogin yes" /etc/ssh/sshd_config 
else
   grep "PermitRootLogin yes" /etc/ssh/sshd_config &>/dev/null; echo $?
fi
