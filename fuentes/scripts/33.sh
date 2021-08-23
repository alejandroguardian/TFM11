#!/bin/bash

LPS=$(grep + /etc/passwd; echo $?)
LSH=$(grep + /etc/shadow; echo $?)
LGR=$(grep + /etc/group; echo $?)
LGS=$(grep + /etc/gshadow; echo $?)

if [ "$LPS" -eq "1" ] && [ "$LSH" -eq "1" ] && [ "$LGR" -eq "1" ] && [ "$LGS" -eq "1" ]; then
   echo 0
else
   if [ "$1" == "D" ]; then
      echo Archivos de usuarios y claves contienen entradas Legacy
   else
      echo 1
   fi
fi
