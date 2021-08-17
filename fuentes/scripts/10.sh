#!/bin/bash

if [ "$1" == "D" ]; then
   cat /etc/passwd | awk -F: '{if ($2 != "x") { print 1 } else { print 0} }' 
else
   cat /etc/passwd | awk -F: '{if ($2 != "x") { print 1 } else { print 0} }' | uniq
fi
