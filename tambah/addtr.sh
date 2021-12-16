#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "UserPassword: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/trojan.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo -e "\e[1;31m"
			echo -e "A client with the specified name was already created, please choose another name."
			echo -e "\e[0m"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)	
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart v2ray@trojan
# systemctl restart trojan ( let me know which one work )
trojanlink="trojan://${uuid}@${domain}:6443"
clear
echo -e ""
echo -e "==========-Trojan-=========="
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "port           : 6443"
echo -e "Key            : ${uuid}"
echo -e "link           : ${trojanlink}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e ""
echo -e "Mod By OnePiece"

