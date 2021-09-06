#!/bin/bash
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
clear

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);
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
echo -e "IP Server         : $IP"
echo -e "Host              : $domain"
echo -e "OpenSSH           : 22, 500"
echo -e "Dropbear          : 143, 109"
echo -e "SSH WS Python     : 100, 2021 , 2020"
echo -e "SSH WS Python SSL : 2052, 2053 "
echo -e "SSL/TLS           : 443, 777"
echo -e "Port Squid        : 8000, 8080 (limit to IP SSH)" 
echo -e "OpenVPN           : TCP 1194 http://$IP:81/client-tcp-1194.ovpn"
echo -e "OpenVPN           : UDP 2200 http://$IP:81/client-udp-2200.ovpn"
echo -e "OpenVPN           : SSL 992 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "badvpn            : 7100, 7200, 7300"
echo -e "==============================="
echo -e "Payload Websocket : GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "                    GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
echo -e "Aktif Sampai   : $exp"
echo -e "Script Mod by OnePiece"
