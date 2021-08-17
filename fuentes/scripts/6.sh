#!/bin/bash

if [ "$1" == "D" ]; then
   cat /etc/passwd | awk -F: '{ print $3 }' | sort | uniq -d 
else
   cat /etc/passwd | awk -F: '{ print $3 }' | sort | uniq -d | wc -l
fi
