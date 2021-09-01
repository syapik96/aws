#!/bin/bash
source /etc/wireguard/params
	NUMBER_OF_CLIENTS=$(grep -c -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### Client $user $exp/,/^AllowedIPs/d" /etc/wireguard/wg0.conf
	# remove generated client file
	rm -f "/home/vps/public_html/$user.conf"

	# restart wireguard to apply changes
	systemctl restart "wg-quick@wg0"
clear
echo " Wireguard Akun berhasil dihapus"
echo " =========================="
echo " Client Name : $user"
echo " Expired  On : $exp"
echo " =========================="
echo " Mod by SL"
