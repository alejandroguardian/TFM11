#!/bin/bash

FILES=$(find / -nouser 2>/dev/null | grep -q "" && echo "1" || echo "0")
FOLDERS=$(find / -nogroup 2>/dev/null | grep -q "" && echo "1" || echo "0")

if [ "$FILES" -eq "0" ] && [ "$FOLDERS" -eq "0" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Se encontraron archivos o directorios sin dueño
   else
      echo 1
   fi
fi
