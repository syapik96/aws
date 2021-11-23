#!/bin/bash
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo -e "\e[1;32m==============================================\e[0m"
	echo -e " \e[1;31mSelect the existing client you want to renew"
	echo -e "          Press CTRL+C to return\e[0m"
	echo -e "\e[1;32m==============================================\e[0m"
	grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vless.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vnone.json
clear
echo ""
echo -e "\e[1;32m========================================\e[0m"
echo -e " VLESS Account Was Successfully Renewed" | lolcat
echo -e "\e[1;32m========================================\e[0m"
echo -e "         \e[1;31mClient Name \e[0m: $user"
echo -e "         \e[1;31mExpired On  \e[0m: $exp4"
echo -e "\e[1;32m========================================\e[0m"
echo -e "           Mod by syapik96" | lolcat
echo -e "\e[1;32m========================================\e[0m"
