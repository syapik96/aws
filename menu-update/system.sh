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
echo -e  " $bl ║\e[m$bd  1$bl]\e[m$bd  Add Subdomain Host For VPS" | lolcat
echo -e  " $bl ║\e[m$bd  2$bl]\e[m$bd  Add ID Cloudflare" | lolcat 
echo -e  " $bl ║\e[m$bd  3$bl]\e[m$bd  Cloudflare Add-Ons" | lolcat
echo -e  " $bl ║\e[m$bd  4$bl]\e[m$bd  Pointing BUG" | lolcat
echo -e  " $bl ║\e[m$bd  5$bl]\e[m$bd  Renew Certificate V2RAY" | lolcat
echo -e  " $bl ║\e[m$bd  6$bl]\e[m$bd  Webmin Menu" | lolcat
echo -e  " $bl ║\e[m$bd  7$bl]\e[m$bd  Check Usage of VPS Ram" | lolcat
echo -e  " $bl ║\e[m$bd  8$bl]\e[m$bd  Reboot VPS" | lolcat
echo -e  " $bl ║\e[m$bd  9$bl]\e[m$bd  Speedtest VPS" | lolcat
echo -e  " $bl ║\e[m$bd 10$bl]\e[m$bd  Information Display System" | lolcat
echo -e  " $bl ║\e[m$bd 11$bl]\e[m$bd  Info Script Auto Install" | lolcat
echo -e  " $bl ║\e[m$bd 12$bl]\e[m$bd  Restart All Service" | lolcat
echo -e  " $bl ║\e[m$bd 13$bl]\e[m$bd  Change Banner"  | lolcat
echo -e  " $bl ║\e[m$bd 14$bl]\e[m$bd  Update" | lolcat
echo -e  " $bl ║\e[m" | lolcat  
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║            0 ) Main Menu      x ) Exit                     ║" | lolcat
echo -e  "  ║      COPYRIGHT ONEPIECEVPN, POWERED BY PRINCENEWBIE.       ║" | lolcat
echo -e  "  ╚════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "\e[1;31m"
read -p  "       Please select an option :  " system
echo -e  "\e[0m"
case $system in
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
		6)
		clear
		webmin
		exit
		;;
		7)
		clear
		ram
		exit
		;;
		8)
		clear
		reboot
		exit
		;;
		9)
		clear
		speedtest
		exit
		;;
		10)
		clear
		info
		exit
		;;
		11)
		clear
		about
		exit
		;;
		12)
		clear
		restart
		exit
		;;
		13)
		echo -e "\e[1;32m"
		echo -e " Command Key Untuk Save Banner Baru Anda Press Key\e[0m :"     
		echo -e " \e[1;31m[ CTRL + X ] [ ENTER ] [ Enter ]\e[0m \e[1;32mUntuk Simpan"
		echo -e " Sesudah itu Reboot Vps anda \e[0m"
		sleep 5
		nano /etc/issue.net
		exit
		;;
		14)
		echo -e "\e[1;31m SORRY!!!! Still No Update , Sila semak repo https://github.com/syapik96/aws masa kesemasa\e[0m "
		sleep 5
		clear
		system
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

