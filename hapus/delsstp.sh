#!/bin/bash 
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/crot-script/data-user-sstp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Anda belum memiliki akun!"
		exit 1
	fi

	echo ""
	echo "Pilih User yg akan di hapus"
	
	grep -E "^### " "/var/lib/crot-script/data-user-sstp" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih salah satu[1]: " CLIENT_NUMBER
		else
			read -rp "Pilih salah satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
pass2="vpn"
psk="vpn"
Client=$(grep -E "^###" /var/lib/crot-script/data-user-sstp | cut -d ' ' -f 2-3 | sed -n "$CLIENT_NUMBER"p)
user=$(grep -E "^###" /var/lib/crot-script/data-user-sstp | cut -d ' ' -f 2 | sed -n "$CLIENT_NUMBER"p)
sed -i "/^### $Client\$/,/^$/d" /var/lib/crot-script/data-user-sstp
sed -i "/^# BEGIN_SSTP $user/,/^# END_SSTP $user/d" /etc/crontab
(printf "1\n\n\n$pass2\n"; sleep 1; printf "Hub $psk\n"; sleep 1; printf "UserDelete\n$user\n") | /usr/local/vpnserver/./vpncmd &> /dev/null 
service cron restart 
echo -e "$user Removed!"
