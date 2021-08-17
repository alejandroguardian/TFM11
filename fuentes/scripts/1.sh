#!/bin/bash

if [ "$1" == "D" ]; then
   cat /etc/passwd | grep :0:
else 
   cat /etc/passwd | grep :0: | wc -l
fi
