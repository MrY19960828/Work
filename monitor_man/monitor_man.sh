###############################################
# File Name:monitor_man.sh
# Author: Yc
# Mail : 1522105005@qq.com
# Created Time: Sat 24 Sep 2016 09:37:06 AM CST
#===============================================
#!/bin/bash

resettem=$(tput sgr0)
declare -A ssharray
i=0
numbers=""

file_list=$(ls -I monitor_man.sh ./)
#for script_file in ${file_list}
for script_file in 'ls -I "monitor_man.sh"  ./'
do
    echo ${script_file}
    echo -e "\e[1;30m" "This Script: "${i} '==>'${resettem} ${script_file}
    i=$((i+1))
done
