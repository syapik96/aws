#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
figlet "Panel V2RAY" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║            Section  V2RAY               ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Vmess Websocket Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Delete Vmess Websocket Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Renew Vmess Account"
echo -e " $bd║\e[m 4$bl]\e[m$bd Check User Login Vmess"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please select an option :  "  v2ray
echo -e ""
case $v2ray in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
