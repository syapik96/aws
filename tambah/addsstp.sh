#!/bin/bash
IP=$(wget -qO- icanhazip.com);
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Usernew: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/crot-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan nama user lain."
			exit 1
		fi
	done
read -p "Password: " pass
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/crot-script/data-user-sstp"
clear
cat <<EOF

================================
SSTP VPN
Server IP     : $IP
Username      : $user
Password      : $pass
Port          : 5555
Cert          : http://$IP:81/server.crt
Expired On    : $exp
================================
Mod By SL
EOF
