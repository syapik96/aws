#!/bin/bash
#Menu
clear

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

figlet -f slant "SYSTEM OPTION" | lolcat
echo -e ""
echo -e  "  ╔════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                        SYSTEM MENU                         ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║\e[m"| lolcat
echo -e  " $bl ║\e[m$bd 1$bl]\e[m$bd  Webmin Menu" | lolcat
echo -e  " $bl ║\e[m$bd 2$bl]\e[m$bd  Check Usage of VPS Ram" | lolcat
echo -e  " $bl ║\e[m$bd 3$bl]\e[m$bd  Reboot VPS" | lolcat
echo -e  " $bl ║\e[m$bd 4$bl]\e[m$bd  Speedtest VPS" | lolcat
echo -e  " $bl ║\e[m$bd 5$bl]\e[m$bd  Information Display System" | lolcat
echo -e  " $bl ║\e[m$bd 6$bl]\e[m$bd  Info Script Auto Install" | lolcat
echo -e  " $bl ║\e[m$bd 7$bl]\e[m$bd  Restart All Service" | lolcat
echo -e  " $bl ║\e[m$bd 8$bl]\e[m$bd  Change Banner"  | lolcat
echo -e  " $bl ║\e[m" | lolcat  
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                0 ) Main Menu      x ) Exit                 ║" | lolcat
echo -e  "  ║           Copyright © 2022 by Github.com/syapik96          ║" | lolcat
echo -e  "  ║              Auto-Script is Powered by PRINCE.             ║" | lolcat
echo -e  "  ╚════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "\e[1;31m"
read -p  "       Please select an option :  " system
echo -e  "\e[0m"
case $system in
		1)
		clear
		webmin
		exit
		;;
		2)
		clear
		ram
		exit
		;;
		3)
		clear
		reboot
		exit
		;;
		4)
		clear
		speedtest
		exit
		;;
		5)
		clear
		info
		exit
		;;
		6)
		clear
		about
		exit
		;;
		7)
		clear
		restart
		exit
		;;
		8)
		echo -e "\e[1;32m"
		echo -e " Command Key Untuk Save Banner Baru Anda Press Key\e[0m :"     
		echo -e " \e[1;31m[ CTRL + X ] [ ENTER ] [ Enter ]\e[0m \e[1;32mUntuk Simpan"
		echo -e " Sesudah itu Reboot Vps anda \e[0m"
		sleep 5
		nano /etc/issue.net
		exit
		;;
		0)
		clear
		menu
		exit
		;;
		x)
		sudo -i
		exit
		;;
		*)
		echo -e "\e[1;31mERROR !! Please enter an correct number\e[0m"
		sleep 3
		clear
		system
		exit
		;;
esac
