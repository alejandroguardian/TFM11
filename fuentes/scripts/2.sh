#!/bin/bash

if [ "$1" == "D" ]; then
   ls /etc/securetty 
else
   ls /etc/securetty &>/dev/null; echo $?
fi
