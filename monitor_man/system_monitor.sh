###############################################
# File Name:system_monitor.sh
# Author: Yc
# Mail : 1522105005@qq.com
# Created Time: Sat 24 Sep 2016 09:39:29 AM CST
#===============================================
#!/bin/bash

clear
if [[ $# -eq 0 ]]
then
reset_color='\e[32m'
reset_terminal=$(tput sgr0);

# Check OS Type
	os=$(uname -o)
	echo -e ${reset_color} "OS Type: " ${reset_terminal} ${os}
# Check OS Release Version and Name
	os_name=$(cat /etc/issue|grep -e "Server")
	echo -e ${reset_color} "OS Release Version and Name: " ${reset_terminal} ${os_name}
# Check Architecture
	architecture=$(uname -m)
	echo -e ${reset_color} "Architecture: " ${reset_terminal} ${architecture}
# Check Kernel Release
	kernel_release=$(uname -r)
	echo -e ${reset_color} "Kernel Release: " ${reset_terminal} ${kernel_release}
# Check hostname $HOSTNAME
        echo -e ${reset_color} "Hostname: " ${reset_terminal} $HOSTNAME
# Check Internal IP
	internal_ip=$(hostname -I)
	echo -e ${reset_color} "Internal IP: " ${reset_terminal} ${internal_ip}
# Check External IP
	external_ip=$(curl -s http://ipecho.net/plain)
	echo -e ${reset_color} "External IP: " ${reset_terminal} ${external_ip}
# Check DNS
	name_servers=$(cat /etc/resolv.conf |grep -E "\<nameserver[ ]+"|awk '{print $NF}')
	echo -e ${reset_color} "DNS: " ${reset_terminal} ${name_servers}
# Check if connected to Internet or not
	ping -c 2 www.baidu.com &>/dev/null && echo -e ${reset_color} "Internet: "  ${reset_terminal} "Connected "|| echo -e ${reset_color} "Internet: "  ${reset_terminal} "Disconnected "
# Check Logged In Users
	who>/tmp/who
	echo -e ${reset_color} "Logged In Users: " ${reset_terminal}  && cat /tmp/who 
	rm -f /tmp/who

####################################
# Check System memuserages
	system_men_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
	echo -e ${reset_color} "System memuserages: " ${reset_terminal} ${system_men_usages} "M"
# Check Apps memuserages
	apps_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
	echo -e ${reset_color} "Apps memuserages: " ${reset_terminal} ${apps_mem_usages} "M"
# Check Load average
	load_averafe=$(top -n 1 b|grep "load average"|awk '{print($11 $12 $13)}')
	echo -e ${reset_color} "Load average: " ${reset_terminal} ${load_averafe}
# Check Disk average
	disk_average=$(df -Ph|grep -vE 'Filesystem|tmpfs'|awk '{print($1 ": " $5)}')
	echo -e ${reset_color} "Disk average: " ${reset_terminal} ${disk_average}


fi
