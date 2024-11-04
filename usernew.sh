#!/bin/bash
# Script by : Prince Newbie

clear
figlet -f slant "NEW ACCOUNT" | lolcat
echo -e "    ==================================="  | lolcat
echo -e "    ║    New SSH & OpenVPN Account    ║"  | lolcat
echo -e "    ==================================="  | lolcat
echo -e "\e[1;32m"
read -p "    * Username : " Login

read -p "    * Password : " Pass

read -p "    * Expired (hari): " masaaktif
echo -e "\e[0m"

echo -e "Ping Host"
sleep 2
echo "Permission Accepted"
clear
sleep 1
echo "Membuat Akun: $Login"
sleep 1
echo "Setting Password: $Pass"
sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
url=$( wget -qO- http://ipecho.net/plain );
IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e " [*][*]============================================================================[*][*]" | lolcat
echo -e "                      Informasi Akaun SSH & OpenVPN" | lolcat
echo -e ""
echo -e "          \e[1;31mUsername          : \e[0m"$Login
echo -e "          \e[1;31mPassword          : \e[0m"$Pass
echo -e ""
echo -e " [*][*]============================================================================[*][*]" | lolcat
echo -e ""
echo -e "          \e[1;31mIP Host           :  \e[0m"$IP
echo -e "          \e[1;31mHost              :  \e[0m"$domain
echo -e "          \e[1;31mOpenSSH           :  \e[0m"22
echo -e "          \e[1;31mDropbear          :  \e[0m"143, 109, 69
echo -e "          \e[1;31mWS Python         :  \e[0m"100 ,
echo -e "          \e[1;31mWS Python         :  \e[0m"80 ,
echo -e "          \e[1;31mWS Python SSL     :  \e[0m"443
echo -e "          \e[1;31mSSL/TLS           :  \e[0m"445, 777
echo -e "          \e[1;31mPort Squid        :  \e[0m"8000 , 8080 limit to IP SSH
echo -e "          \e[1;31mOpenVPN TCP 1194  :  \e[0m"http://${url}:81/client-tcp-1194.ovpn
echo -e "          \e[1;31mOpenVPN UDP 2200  :  \e[0m"http://${url}:81/client-udp-2200.ovpn
echo -e "          \e[1;31mOpenVPN SSL 992   :  \e[0m"http://${url}:81/client-tcp-ssl.ovpn
echo -e "          \e[1;31mbadvpn            :  \e[0m"7100 - 7900
echo -e ""
echo -e " [*][*]==================================================================================[*][*]" | lolcat
echo -e ""
echo -e "\e[1;32   Payload : GET / HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] \e[0m"
echo -e ""
echo -e " [*][*]==================================================================================[*][*]" | lolcat
echo -e ""
echo -e "     \e[1;31mAktif Sampai   : \e[0m"$exp
echo -e "     \e[1;32mBack Menu enter >> \e[0m"0
echo -e "     \e[1;32mJust Hit Enter To Exit >> \e[0m"
echo -e ""
echo -e " #####===============[ Terima Kasih Telah Menggunakan Perkhidmatan Kami ]=================#####" | lolcat
echo -e "\e[1;32m"
read -p "        Back Menu or Exit : " Lari
echo -e "\e[0m"
case $Lari in 
     0)
     clear 
     menu 
     exit
     ;;
     *)
     sudo -i
     exit
     ;;
esac     
