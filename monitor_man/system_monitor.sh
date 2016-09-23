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
fi
