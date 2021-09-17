#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
figlet "PANEL DOMAIN" | lolcat
echo -e ""
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║            Section DOMAIN          ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Add Subdomain Host For VPS"
echo -e " $bd║\e[m 2$bl]\e[m$bd Add ID Cloudflare"
echo -e " $bd║\e[m 3$bl]\e[m$bd Cloudflare Add-Ons" 
echo -e " $bd║\e[m 4$bl]\e[m$bd Pointing BUG"
echo -e " $bd║\e[m 5$bl]\e[m$bd Renew Certificate V2RAY"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please select an option  :  "  dns
echo -e ""
case $dns in
1)
add-host
;;
2)
cff
;;
3)
cfd
;;
4)
cfh
;;
5)
certv2ray
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
