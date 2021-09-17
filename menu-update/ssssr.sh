#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bd='\e[1m'
bl='\e[36;1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e ""
figlet SSR/SS | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║            PANEL SSR & SS             ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd  Create SSR Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd  Create Shadowsocks Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd  Deleting SSR Account"
echo -e " $bd║\e[m 4$bl]\e[m$bd  Delete Shadowsocks Account"
echo -e " $bd║\e[m 5$bl]\e[m$bd  Renew SSR Account Active"
echo -e " $bd║\e[m 6$bl]\e[m$bd  Renew Shadowsocks Account"
echo -e " $bd║\e[m 7$bl]\e[m$bd  Show Other SSR Menu"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e ""
read -p "     Please Input Number  :  "  ssssr
echo -e ""
case $ssssr in
1)
addssr
;;
2)
addss
;;
3)
delssr
;;
4)
delss
;;
5)
renewssr
;;
6)
renewss
;;
7)
ssr
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
