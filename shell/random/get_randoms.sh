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

# 如果想直接随机抽文件的行
sort --random-sort file_name | head -n raw_size > result_file
sort -R file_name|head -n raw_size >result_file

# method 1
function rand(){
    min=$1
    max=$(($2-$min+1))
    #num=$(date +%s%N)
    num=$(($RANDOM+1000000000))
    echo $(($num%$max+$min))
}

# method 2
function rand2(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(date +%s%N)  
    echo $(($num%$max+$min))  
}  

# method 3
function rand3(){
    min=$1
    max=$(($2-$min+1))
    num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')
    echo $(($num%$max+$min))
}

# for test
for((i=0;i<$3;i++));
do
    rnd=$(rand $1 $2)
    echo $rnd
done

exit 0

