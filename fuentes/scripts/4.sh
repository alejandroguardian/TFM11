#!/bin/bash

if [ "$1" == "D" ]; then
   cat /etc/passwd | awk -F: '{if ($3 < 500 && $1 != "root") { if (!$7~"sh") print 1} else { print 0} }' 
else
   cat /etc/passwd | awk -F: '{if ($3 < 500 && $1 != "root") { if (!$7~"sh") print 1} else { print 0} }' |uniq
fi
