#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e ""
figlet "Panel Vless" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║            Section  V2RAY             ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Vless Websocket Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Deleting Vless Websocket Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Renew Vless Account "
echo -e " $bd║\e[m 4$bl]\e[m$bd Check User Login Vless"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please select an option :  "  vless
echo -e ""
case $vless in
1)
add-vless
;;
2)
del-vless
;;
3)
renew-vless
;;
4)
cek-vless
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
