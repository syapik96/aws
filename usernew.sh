#!/bin/bash

clear

echo -e "Name : Create SSH & OpenVPN Account" | lolcat
echo -e "=============================="
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- http://ipecho.net/plain | xargs echo);trickinternetvpns
domain=$(cat /etc/hostname);
echo "Script AutoCreate Akaun SSH dan OpenVPN Mod By OnePiece"
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Terima Kasih Telah Menggunakan Layanan Kami"
echo -e "Informasi Akaun SSH & OpenVPN"
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "==============================="
echo -e "IP Host           : $IP"
echo -e "Host              : $domain"
echo -e "OpenSSH           : 22, 500"
echo -e "Dropbear          : 143, 109"
echo -e "SSH WS Python     : 100, 2021 , 2020"
echo -e "SSH WS Python SSL : 2052, 2053 "
echo -e "SSL/TLS           : 443, 777"
echo -e "Port Squid        : 8000, 8080 (limit to IP SSH)" 
echo -e "OpenVPN           : TCP 1194 http://$domain:81/client-tcp-1194.ovpn"
echo -e "OpenVPN           : UDP 2200 http://$domain:81/client-udp-2200.ovpn"
echo -e "OpenVPN           : SSL 992 http://$domain:81/client-tcp-ssl.ovpn"
echo -e "badvpn            : 7100, 7200, 7300"
echo -e "==============================="
echo -e "Payload Websocket : GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
echo -e "Aktif Sampai   : $exp"
echo -e "Script Mod by OnePiece"
