#!/bin/bash
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(wget -qO- http://ipecho.net/plain | xargs echo);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premim-script/data-user-l2tp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan password lain."
			exit 1
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

# Add or update VPN user
cat > /etc/ppp/chap-secrets <<-EOF
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat > /etc/ipsec.d/passwd <<-EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-l2tp"
cat <<-EOF

================================
L2TP/IPSEC PSK VPN

Server IP    : $PUBLIC_IP
Host         : $domain
IPsec PSK    : vpn
Username     : $VPN_USER
Password     : $VPN_PASSWORD
Expired ON   : $exp

Mod By OnePiece
=================================
EOF
