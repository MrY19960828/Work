###############################################
# File Name:monitor_man.sh
# Author: Yc
# Mail : 1522105005@qq.com
# Created Time: Sat 24 Sep 2016 09:37:06 AM CST
#===============================================
#!/bin/bash

reset_color='\e[35m'
reset_terminal=$(tput sgr0);

declare -A ssharray
i=0
numbers=""

file_list=$(ls -I monitor_man.sh ./)
for script_file in ${file_list}
do
    echo -e ${reset_color} "This Script: "${i} '==>'${reset_terminal} ${script_file}
    ssharray[$i]=${script_file}
    numbers="${numbers} | $i"
    i=$((i+1))
done

while true
do
    read -p "Pleace input a number [ ${numbers}]: " exec_shell
    if [[ ! ${exec_shell} =~ ^[0-9]*$ ]];then
        exit 0
    fi
    if [[ "${exec_shell}" -ge "${#ssharray[*]}" ]];then
        exit 0
    fi
    /bin/sh ${ssharray[$exec_shell]}
done
