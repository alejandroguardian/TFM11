#!/bin/bash

R1=$(grep -q "net.ipv4.conf.all.secure_redirects = 1" /etc/sysctl.conf |grep -v "#"; echo $?)
R2=$(grep -q "net.ipv4.tcp_syncookies = 1" /etc/sysctl.conf | grep -v "#"; echo $?)
R3=$(grep -q "net.ipv4.conf.all.rp_filter = 1" /etc/sysctl.conf | grep -v "#"; echo $?)
R4=$(grep -q "net.ipv4.conf.all.accept_source_route = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R5=$(grep -q "net.ipv4.conf.all.accept_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R6=$(grep -q "net.ipv4.conf.all.secure_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R7=$(grep -q "net.ipv4.conf.default.rp_filter = 1" /etc/sysctl.conf | grep -v "#"; echo $?)
R8=$(grep -q "net.ipv4.conf.default.accept_source_route = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R9=$(grep -q "net.ipv4.conf.default.accept_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R10=$(grep -q "net.ipv4.conf.default.secure_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R11=$(grep -q "net.ipv4.icmp_echo_ignore_broadcasts = 1" /etc/sysctl.conf | grep -v "#"; echo $?)
R12=$(grep -q "net.ipv4.ip_forward = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R13=$(grep -q "net.ipv4.conf.all.send_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R14=$(grep -q "net.ipv4.conf.default.send_redirects = 0" /etc/sysctl.conf | grep -v "#"; echo $?)
R15=$(grep -q "net.ipv4.icmp_ignore_bogus_error_responses = 1" /etc/sysctl.conf | grep -v "#"; echo $?)

RETORNO=0
if [ "$R1" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.secure_redirects = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R2" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.tcp_syncookies = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R3" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.rp_filter = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R4" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.accept_source_route = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R5" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.accept_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R6" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.secure_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R7" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.default.rp_filter = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R8" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.default.accept_source_route = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R9" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.default.accept_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R10" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.default.secure_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R11" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.icmp_echo_ignore_broadcasts = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R12" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.ip_forward = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R13" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.all.send_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R14" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.conf.default.send_redirects = 0" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

if [ "$R15" -ne "0" ]; then
   RETORNO=1
   if [ "$1" == "D" ]; then
      echo No se encontro el valor "net.ipv4.icmp_ignore_bogus_error_responses = 1" en /etc/sysctl.conf
   else
      echo 1
   fi
fi

# Cierro script
if [ "$RETORNO" -eq "0" ]; then
   echo 0
fi

