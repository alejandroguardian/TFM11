#!/bin/bash


FILES="/etc/sysconfig/init /etc/rc.d/init.d/functions /etc/profile /etc/bashrc /etc/csh.cshrc /etc/csh.login /etc/skel/.bashrc /etc/vsftpd/vsftpd.conf /root/.bash_profile /root/.bashrc /root/.cshrc /root/.tcshrc"

RET=0
RES=""
for i in ${FILES}
do
   if [ -f $i ]; then
      PERM=$(ls -l $i | awk '{ print $1 }')
      if [ "$PERM" != "-rw-r--r--" ]; then
         RET=1
	 RES=$i
      fi
   fi 
done

if [ "$RET" -ne "0" ]; then
   if [ "$1" == "D" ]; then
      echo Permisos incorrectos para $RES. No son 644
   else
      echo 1
   fi
else
   echo 0
fi
