#!/bin/bash

if [ "$1" == "D" ]; then
   find /home -name .forward | grep -q "." 
else
   find /home -name .forward | grep -q "." ; echo $?
fi
