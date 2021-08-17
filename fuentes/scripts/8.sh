#!/bin/bash

if [ "$1" == "D" ]; then
   grep faillock /etc/pam.d/*
else
   grep faillock /etc/pam.d/*; echo $?
fi
