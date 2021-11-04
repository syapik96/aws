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
echo -e "    x)   MENU   exit) Just Enter     \e[m" | lolcat
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e "\e[1;31m"
read -p "     Please Input Number  [1-9 or x] :  "  ssh
echo -e "\e[0m"
case $ssh in
1)
clear
usernew
exit
;;
2)
clear
trial
exit
;;
3)
clear
renew
exit
;;
4)
clear
deluser
exit
;;
5)
clear
cek
exit
;;
6)
clear
member
exit
;;
7)
clear
delete
exit
;;
8)
clear
autokill
exit
;;
9)
clear
ceklim
exit
;;
x)
clear
menu
;;
clear
exit
sudo -i
;;
*)
echo "Please enter an correct number"
;;
esac
