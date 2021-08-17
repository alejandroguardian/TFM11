#!/bin/bash

if [ "$1" == "D" ]; then
   find /home -maxdepth 2 -name ".exrc" -print | xargs grep -q "!"
else
   find /home -maxdepth 2 -name ".exrc" -print | xargs grep -q "!"; echo $?
fi
