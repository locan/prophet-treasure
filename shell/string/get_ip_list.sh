#!/bin/bash
#########################################################################
# File Name: get_ip_list.sh
# Author: luanpeng
# mail: luanpeng@163.com
# Created Time: 2018-05-09 23:17:21
#########################################################################


wan_ip="10.99.9.2"
wan_pci="00:03:00:11.1"
ip_list="(wan, wan_ip, 0)"

wan=$(echo ${wan_pci} | cut -d "." -f2)
ip_list=${ip_list//'wan_ip'/$wan_ip//'wan'/$wan}
#ip_list=${ip_list//'wan'/$wan}
echo $ip_list

exit 0

