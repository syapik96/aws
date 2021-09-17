#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
figlet PANEL SSH | lolcat -d 5
echo -e ""
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[mSSH & OpenVPN Menu\e[1;31m]═\e[m" 
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e " 1$bl]\e[m$bd  Create SSH & OpenVPN Account"
echo -e " 2$bl]\e[m$bd  Trial Account SSH & OpenVPN"
echo -e " 3$bl]\e[m$bd  Renew SSH & OpenVPN Account"
echo -e " 4$bl]\e[m$bd  Delete SSH & OpenVPN Account"
echo -e " 5$bl]\e[m$bd  Check User Login SSH & OpenVPN"
echo -e " 6$bl]\e[m$bd  List Member SSH & OpenVPN"
echo -e " 7$bl]\e[m$bd  Delete User Expired SSH & OpenVPN"
echo -e " 8$bl]\e[m$bd  Set up Autokill SSH"
echo -e " 9$bl]\e[m$bd  Cek Users Who Do Multi Login SSH"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU        \e[m" | lolcat
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please Input Number  [1-9 or x] :  "  ssh
echo -e ""
case $ssh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
x)
exit
;;
*)
echo "Please enter an correct number"
;;
esac
