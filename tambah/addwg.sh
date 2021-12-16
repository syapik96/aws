#!/bin/bash
# updated by syapik96

# Load params
source /etc/wireguard/params
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(wget -qO- icanhazip.com);
else
SERVER_PUB_IP=$IP
fi

	echo ""
	echo -e "Tell me a name for the client."
	echo -e "Use one word only, no special characters."

	until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Client name: " -e CLIENT_NAME
		CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
		    echo -e ""
		    echo -e "A client with the specified name was already created, please choose another name."
		    exit 1
		fi
	done

	echo -e "IPv4 Detected"
	ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
	WG_CONFIG="/etc/wireguard/wg0.conf"
	LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
	if [[ "$LASTIP" = "" ]]; then
	CLIENT_ADDRESS="10.66.66.2"
	else
	CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
	fi

	# Adguard DNS by default
	CLIENT_DNS_1="1.1.1.1"
	CLIENT_DNS_2="1.0.0.1"
	MYIP=$(wget -qO- ifconfig.co);
	
	read -p "Expired (days): " masaaktif
	exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

	# Generate key pair for the client
	CLIENT_PRIV_KEY=$(wg genkey)
	CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
	CLIENT_PRE_SHARED_KEY=$(wg genpsk)

# Create client file and add the server as a peer
echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >> "$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

# Add the client as a peer to the server
echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >> "/etc/wireguard/$SERVER_WG_NIC.conf"

systemctl restart "wg-quick@$SERVER_WG_NIC"
cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
clear
sleep 0.5
echo Generate PrivateKey
sleep 0.5
echo Generate PublicKey
sleep 0.5
echo Generate PresharedKey
clear
echo -e ""
echo -e "==========-Wireguard-=========="
echo -e "Wireguard	: http://$MYIP:81/$CLIENT_NAME.conf"
echo -e "==============================="
echo -e "Expired On     : $exp"
echo -e ""
echo -e "Mod By syapik96"
rm -f /root/wg0-client-$CLIENT_NAME.conf
