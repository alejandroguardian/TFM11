#!/bin/bash

GRAFICO=$([ "$DISPLAY" ] || [ "$WAYLAND_DISPLAY" ] || [ "$MIR_SOCKET" ] && echo X)
if [ "$GRAFICO" != "X" ]; then
   echo 0
else
   if [ "$1" != "D" ]; then
      echo 1
   else
      echo El equipo se encuentra en modo grafico
   fi
fi
