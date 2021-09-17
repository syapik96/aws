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
figlet "PANEL TROJAN" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║           Section  TROJAN             ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Trojan Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Deleting Trojan Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Renew Trojan Account"
echo -e " $bd║\e[m 4$bl]\e[m$bd Check User Login Trojan"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please select an option :  "  trojan
echo -e ""
case $trojan in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
