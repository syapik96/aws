#!/bin/bash
IP=$(wget -qO- icanhazip.com);
echo "Please enter the username you want to set (do not repeat, does not support Chinese, will be reported incorrect!)"
read -e -p "(Default: ):" ssr_user
CLIENT_EXISTS=$(grep -w $ssr_user /usr/local/shadowsocksr/akun.conf | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "A client with the specified name was already created, please choose another name."
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
ssr_method="aes-128-cfb"
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
echo -e "${Info} Penambahan user berhasil [username: ${ssr_user}]"
echo -e "### $ssr_user $exp" >> /usr/local/shadowsocksr/akun.conf
tmp1=$(echo -n "${ssr_password}" | base64 -w0 | sed 's/=//g;s/\//_/g;s/+/-/g')
SSRobfs=$(echo ${ssr_obfs} | sed 's/_compatible//g')
tmp2=$(echo -n "$IP:${ssr_port}:${ssr_protocol}:${ssr_method}:${SSRobfs}:${tmp1}/obfsparam=" | base64 -w0)
ssr_link="ssr://${tmp2}"
/etc/init.d/ssrmu restart
IP=$(wget -qO- ifconfig.co);
clear && echo && echo "===================================================" && echo
echo -e " User [${ssr_user}] configuration info："
echo -e " IP            : ${IP}"
echo -e " Host          : ${domain}"
echo -e " Port          : ${ssr_port}"
echo -e " Password      : ${ssr_password}"
echo -e " Encryption    : ${ssr_method}"
echo -e " Protocol      : ${Red_font_prefix}${ssr_protocol}"
echo -e " Obfs          : ${Red_font_prefix}${ssr_obfs}"
echo -e " Device limit  : ${ssr_protocol_param}"
echo -e " Expired On    : ${exp} "
echo "==================================================="
echo -e " Link SSR      : ${ssr_link}"
echo "==================================================="
echo -e " Script Mod SL"
