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
figlet "Panel Wireguard" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║            PANEL WIREGUARD            ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Wireguard Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Delete Wireguard Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Check User Login Wireguard"
echo -e " $bd║\e[m 4$bl]\e[m$bd Renew Wireguard Account"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please Input Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
addwg
;;
2)
delwg
;;
3)
wg show
;;
4)
renewwg
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
