#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

apt install jq curl -y
IP=$(wget -qO- icanhazip.com)
DOMAIN=gilergames.tk
#sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
echo "    Cloudflare with SNI Bug "
echo "Enter your ISPbughost pointed VPS IP "
read -rp " Enteer : " -e host
SUB_DOMAIN=${sub}.gilergames.tk
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=a4ec64a08c4e1c628ec4d86d198057ba
RECORD=cf91f31ad3a694e6e893b5013bffa288
if [[ "${#RECORD}" -le 10 ]]; then
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/a4ec64a08c4e1c628ec4d86d198057ba/dns_records" \
     -H "Content-Type: application/json" \
     -H "X-Auth-Email: zulhisyam421@gmail.com" \
     -H "X-Auth-Key: 48e94b491ba3933abe8732b9a5f91cf3f3c3" \
     --data '{"type":"A","name":"${sub}.gilergames.tk","content":"${IP}","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/a4ec64a08c4e1c628ec4d86d198057ba/dns_records/${sub}.gilergames.tk" \
     -H "X-Auth-Email: zulhisyam421@gmail.com" \
     -H "X-Auth-Key: 48e94b491ba3933abe8732b9a5f91cf3f3c3" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"${sub}.gilergames.tk","content":"$IP","ttl":120,"proxied":false}')
echo "IP=$SUB_DOMAIN" > /var/lib/premium-script/ipvps.txt
echo $SUB_DOMAIN > /root/domain
rm -f /root/cf.sh
