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
figlet "L2TP/PPTP/SSTP" | lolcat
echo -e ""
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║        PANEL L2TP/PPTP/SSTP           ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd  Creating L2TP Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd  Create Account PPTP"
echo -e " $bd║\e[m 3$bl]\e[m$bd  Creating SSTP Account"
echo -e " $bd║\e[m 4$bl]\e[m$bd  Deleting L2TP Account"
echo -e " $bd║\e[m 5$bl]\e[m$bd  Delete PPTP Account"
echo -e " $bd║\e[m 6$bl]\e[m$bd  Deleting SSTP Account"
echo -e " $bd║\e[m 7$bl]\e[m$bd  Renew L2TP Account"
echo -e " $bd║\e[m 8$bl]\e[m$bd  Renew PPTP Account"
echo -e " $bd║\e[m 9$bl]\e[m$bd  Renew SSTP Account"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please Input Number  :  "  l2tp
echo -e ""
case $l2tp in
1)
addl2tp
;;
2)
addpptp
;;
3)
addsstp
;;
4)
dell2tp
;;
5)
delpptp
;;
6)
delsstp
7)
renewl2tp
;;
7)
renewpptp
;;
7)
renewsstp
;;
0)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
