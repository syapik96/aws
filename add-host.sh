#!/bin/bash
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ###
### Script Update by : t.me/PrinceNewbie ####

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
#source /root/mail2,3,4.txt
DOMAIN="$( cat /root/mail2.txt )"
CF_ID="$( cat /root/mail3.txt )"
CF_KEY="$( cat /root/mail4.txt )"
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo -e  ""
echo -e  "\e[0;32m====AutoScriptVPN by Prince Newbie====\e[0m" 
echo -e  "\e[1;31m"
read -p "    Masukan Subdomain Anda :" sub
echo -e  "\e[0m"
echo -e "Updating DNS for ${sub}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${sub}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${sub}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "DONE...!"
echo "Host : $SUB_DOMAIN"
echo "$SUB_DOMAIN > /root/domain"
echo "$SUB_DOMAIN > /etc/v2ray/domain"
echo "$IP > /var/lib/premium-script/ipvps.conf"
