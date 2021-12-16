#!/bin/bash
# Modified By PrinceNewBie
# Telegram: https://t.me/PrinceNewbie

yl='\e[32;1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

clear
IP=$(wget -qO- icanhazip.com);
echo -e "╔═════════════════════════════════════════════════════════╗" | lolcat
echo -e "║       Name : Create ShadowsocksR Account                ║" | lolcat
echo -e "╠═════════════════════════════════════════════════════════╣" | lolcat 
echo -e "    \e[32;1mPlease enter the username you want to set\e[0m"
echo -e "    \e[1;31m(do not repeat, does not support Chinese, " 
echo -e "     will be reported incorrect!) \e[0m"

read -e -p "      (Default: ):" ssr_user

CLIENT_EXISTS=$(grep -w $ssr_user /usr/local/shadowsocksr/akun.conf | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo "${red}"
echo "A client with the specified name was already created, please choose another name."
echo "${NC}"
exit 1
fi

read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
lastport=$(cat /usr/local/shadowsocksr/mudb.json | grep '"port": ' | tail -n1 | awk '{print $2}' | cut -d "," -f 1 | cut -d ":" -f 1 )

if [[ $lastport == '' ]]; then
ssr_port=7443
else
ssr_port=$((lastport+1))
fi
ssr_password="$ssr_user"
ssr_method="aes-256-cfb"
ssr_protocol="origin"
ssr_obfs="http_post"
ssr_protocol_param=""
ssr_speed_limit_per_con=0
ssr_speed_limit_per_user=0
ssr_transfer="838868"
ssr_forbid="bittorrent"
cd /usr/local/shadowsocksr
match_add=$(python mujson_mgr.py -a -u "${ssr_user}" -p "${ssr_port}" -k "${ssr_password}" -m "${ssr_method}" -O "${ssr_protocol}" -G "${ssr_protocol_param}" -o "${ssr_obfs}" -s "${ssr_speed_limit_per_con}" -S "${ssr_speed_limit_per_user}" -t "${ssr_transfer}" -f "${ssr_forbid}"|grep -w "add user info")
cd
echo -e "Info User added successfully [username: ${ssr_user}]"
echo -e "### $ssr_user $exp" >> /usr/local/shadowsocksr/akun.conf
tmp1=$(echo -n "${ssr_password}" | base64 -w0 | sed 's/=//g;s/\//_/g;s/+/-/g')
SSRobfs=$(echo ${ssr_obfs} | sed 's/_compatible//g')
tmp2=$(echo -n "$IP:${ssr_port}:${ssr_protocol}:${ssr_method}:${SSRobfs}:${tmp1}/obfsparam=" | base64 -w0)
ssr_link="ssr://${tmp2}"
/etc/init.d/ssrmu restart
IP=$(wget -qO- icanhazip.com);
echo -e ""
echo -e "╔════════════════════════════════════════════════════════════╗" | lolcat
echo -e "║         User [${ssr_user}] configuration info：            ║" | lolcat
echo -e "╠════════════════════════════════════════════════════════════╣" | lolcat 
echo -e "║ " | lolcat
echo -e "║ \e[32;1mIP            : ${IP}"
echo -e "║ \e[32;1mHost          : ${domain}"
echo -e "║ \e[32;1mPort          : ${ssr_port}"
echo -e "║ \e[32;1mPassword      : ${ssr_password}"
echo -e "║ \e[32;1mEncryption    : ${ssr_method}"
echo -e "║ \e[32;1mProtocol      : ${Red_font_prefix}${ssr_protocol}"
echo -e "║ \e[32;1mObfs          : ${Red_font_prefix}${ssr_obfs}"
echo -e "║ \e[32;1mDevice limit  : ${ssr_protocol_param}"
echo -e "║ \e[32;1mExpired On    : ${exp} "
echo -e "║ " | lolcat
echo -e "╠═════════════════════════════════════════════════════════" | lolcat
echo -e "║  Link SSR      : ${ssr_link}"
echo -e "╠════════════════════════════════════════════════════════╗" | lolcat
echo -e "║            COPYRIGHT © 2021 by Prince Newbie           ║" | lolcat
echo -e "╚════════════════════════════════════════════════════════╝" | lolcat
echo -e "\e[32;1m      ENTER [ 0 ] TO MENU PRESS [ ENTER ] TO EXIT \e[0m  "
echo -e  "${red}"
read -p "         ENTER KEY    : " plus
echo -e "${NC}"
case $plus in
    *)
    sudo -i
    exit
    ;;
    0)
    clear
    menu
    exit
    ;;
esac  

