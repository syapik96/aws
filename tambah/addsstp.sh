#!/bin/bash
# updated by syapik96

IP=$(wget -qO- http://ipecho.net/plain | xargs echo);
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Usernew: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan nama user lain."
			exit 1
		fi
	done
read -p "Password: " pass
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat > /home/sstp/sstp_account <<-EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
clear
cat <<-EOF

echo -e "=============== SSTP VPN ================="

echo -e "Server IP     : $IP"
echo -e "Username      : $user"
echo -e "Password      : $pass"
echo -e "Port          : 5555"
echo -e "Cert          : http://$IP:81/server.crt"
echo -e "Expired On    : $exp"
echo -e "================================"
echo -e "Mod By OnePiece"
EOF
