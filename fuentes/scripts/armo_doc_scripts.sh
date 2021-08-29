for i in $(ls | sort -g)
do
   echo $i
   echo " "
   cat $i
   echo " "
done
