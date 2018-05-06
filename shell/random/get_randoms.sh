#!/bin/bash
#########################################################################
# File Name: get_randoms.sh
# Author: luanpeng
# mail: luanpeng@163.com
# Created Time: 2018-05-06 22:47:04
# Description: 3 input. 
#            - $1:min, 
#            - $2:max, 
#            - $3:scale
#########################################################################


function rand(){
    min=$1
    max=$(($2-$min+1))
    #num=$(date +%s%N)
    num=$(($RANDOM+1000000000))
    echo $(($num%$max+$min))
}


function rand2(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(date +%s%N)  
    echo $(($num%$max+$min))  
}  


function rand3(){
    min=$1
    max=$(($2-$min+1))
    num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')
    echo $(($num%$max+$min))
}

for((i=0;i<$3;i++));
do
    rnd=$(rand $1 $2)
    echo $rnd
done

exit 0

