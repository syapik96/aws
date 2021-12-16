#!/bin/bash
read -rp "User: " -e user
pass2="vpn"
psk="vpn"
exp=$(grep -E "^### $user" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 2-3)
sed -i "/^### $Client $exp\$/,/^$/d" /var/lib/premium-script/data-user-sstp
sed -i "/^# BEGIN_SSTP $user/,/^# END_SSTP $user/d" /etc/crontab
(printf "1\n\n\n$pass2\n"; sleep 1; printf "Hub $psk\n"; sleep 1; printf "UserDelete\n$user\n") | /usr/local/vpnserver/./vpncmd &> /dev/null 
