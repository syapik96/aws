#!/bin/bash
# Updated October2021

clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);

figlet -f standard "PANEL DOMAIN" | lolcat
echo -e ""
echo -e "  ╠═══════════════════════════════════════╣" | lolcat
echo -e "  ║            Section DOMAIN             ║" | lolcat
echo -e "  ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd ║"
echo -e " $bd ║    1 ]  Add Subdomain Host For VPS" | lolcat
echo -e " $bd ║    2 ]  Add ID Cloudflare" | lolcat
echo -e " $bd ║    3 ]  Cloudflare Add-Ons" | lolcat
echo -e " $bd ║    4 ]  Pointing BUG" | lolcat
echo -e " $bd ║    5 ]  Renew Certificate V2RAY" | lolcat
echo -e " $bd ║"
echo -e "  ╠═══════════════════════════════════════╣" | lolcat
echo -e "  ║  0]  RETURN  MENU                     ║" | lolcat
echo -e "  ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -e -p "     Please select an option  :  "  pintu
case $pintu in
     1)
     clear
     add-host
     exit
     ;;
     2)
     clear
     cff
     exit
     ;;
     3)
     clear
     cfd
     exit
     ;;
     4)
     clear
     cfh
     exit
     ;;
     5)
     clear
     certv2ray
     exit
     ;;
     0)
     clear
     menu
     exit
     ;;
     *)
     echo -e "Please enter an correct number"
     ;;
 esac
