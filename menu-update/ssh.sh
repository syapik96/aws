#!/bin/bash
# updated by syapik96

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
clear
figlet -f slant "PANEL SSH & OpenVPN" | lolcat
echo -e ""
echo -e  "  ╔════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                     SSH & OpenVPN Menu                     ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"| lolcat
echo -e  " $bl ║\e[m$bd 1$bl]\e[m$bd Create SSH & OpenVPN Account"
echo -e  " $bl ║\e[m$bd 2$bl]\e[m$bd Trial Account SSH & OpenVPN"
echo -e  " $bl ║\e[m$bd 3$bl]\e[m$bd Renew SSH & OpenVPN Account"
echo -e  " $bl ║\e[m$bd 4$bl]\e[m$bd Delete SSH & OpenVPN Account"
echo -e  " $bl ║\e[m$bd 5$bl]\e[m$bd Check User Login SSH & OpenVPN"
echo -e  " $bl ║\e[m$bd 6$bl]\e[m$bd List Member SSH & OpenVPN"
echo -e  " $bl ║\e[m$bd 7$bl]\e[m$bd Delete User Expired SSH & OpenVPN"
echo -e  " $bl ║\e[m$bd 8$bl]\e[m$bd Set up Autokill SSH"
echo -e  " $bl ║\e[m$bd 9$bl]\e[m$bd Cek Users Who Do Multi Login SSH"
echo -e  " $bl ║"| lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║            0 ) Main Menu      x ) Exit                     ║" | lolcat
echo -e  "  ║      COPYRIGHT ONEPIECEVPN, POWERED BY PRINCENEWBIE.       ║" | lolcat
echo -e  "  ╚════════════════════════════════════════════════════════════╝" | lolcat
echo -e "\e[1;31m"
read -p "            Please Input Number :  " ssh1
echo -e "\e[0m"
case $ssh1 in
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
	hapus
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
	autokick
	exit
	;;
	9)
	clear
	ceklim
	exit
	;;
	0)
	clear
	menu
	exit
	;;
	x)
        clear
	prince
	exit
	;;
        *)
        echo -e "${red}Please enter the correct number${NC}
        clear
        exit
        ;;
     esac
