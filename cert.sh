#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
echo "Checking VPS"
clear
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop v2ray
systemctl stop v2ray@none
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
echo Done
