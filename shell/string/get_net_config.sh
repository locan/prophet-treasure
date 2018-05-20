#!/bin/bash
#########################################################################
# File Name: get_net_config.sh
# Author: luanpeng
# mail: luanpeng@vip.com
# Created Time: 2018-05-07 23:58:57
#########################################################################

data=$1
lines=`cat $1|grep -o '(.*)'| tr "),(" "\n"|awk ' {if($1!="") print $1;} '`
i=0
temp=''
for line in `echo $lines`
do
    temp=$temp" "$line
    ((i=i+1))
    if [ $(($i % 3)) -eq 0 ];then
        echo $temp
        temp=''
    fi
done

exit 0


