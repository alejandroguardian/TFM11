#!/bin/bash

if [ "$1" == "D" ]; then
   grpck
else
   grpck &>/dev/null; echo $?
fi
