#!/bin/bash
# VPN Premium Script
# © Github.com/syapik96
# Orignal Repository: https://github.com/syapik96/aws
# Modified By PrinceNewBie
# Telegram: https://t.me/ PrinceNewbie
# Thanks for using this script, Enjoy Highspeed VPN Service


if [ "$EUID" -ne 0 ]; then
  echo -e "${rd}Skrip perlu dijalankan sebagai root!${nc}";
  exit 1
fi

clear 
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
nc='\e[0m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	
echo -e  "  ╔════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                    ♠  AutoScriptVPN  ♠                     ║" | lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "  ║                      VPS PANEL INFO" | lolcat
echo -e  "  ║ " | lolcat
echo -e  "  ║    \e[32;1mCPU Model:\e[0m $cname  "
echo -e  "  ║    \e[32;1mNumber Of Cores:\e[0m $cores"
echo -e  "  ║    \e[32;1mCPU Frequency:\e[0m $freq MHz"
echo -e  "  ║    \e[32;1mTotal Amount Of RAM:\e[0m $tram MB"
echo -e  "  ║    \e[32;1mSystem Uptime:\e[0m $up"
echo -e  "  ║    \e[32;1mIsp Name:\e[0m $ISP"
echo -e  "  ║    \e[32;1mIp Vps:\e[0m $IPVPS"
echo -e  "  ║    \e[32;1mCity:\e[0m $CITY"
echo -e  "  ║    \e[32;1mTime:\e[0m $WKT"
echo -e  "  ║ " | lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                     SSH & OpenVPN Menu                     ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "  $bl║"| lolcat
echo -e  "  $bl║\e[m$bd 1$bl]\e[m$bd Create SSH & OpenVPN Account"
echo -e  "  $bl║\e[m$bd 2$bl]\e[m$bd Trial Account SSH & OpenVPN"
echo -e  "  $bl║\e[m$bd 3$bl]\e[m$bd Renew SSH & OpenVPN Account"
echo -e  "  $bl║\e[m$bd 4$bl]\e[m$bd Delete SSH & OpenVPN Account"
echo -e  "  $bl║\e[m$bd 5$bl]\e[m$bd Check User Login SSH & OpenVPN"
echo -e  "  $bl║\e[m$bd 6$bl]\e[m$bd List Member SSH & OpenVPN"
echo -e  "  $bl║\e[m$bd 7$bl]\e[m$bd Delete User Expired SSH & OpenVPN"
echo -e  "  $bl║\e[m$bd 8$bl]\e[m$bd Set up Autokill SSH"
echo -e  "  $bl║\e[m$bd 9$bl]\e[m$bd Cek Users Who Do Multi Login SSH"
echo -e  "  $bl║ " | lolcat
echo -e  "  $bl║   [ 0 ] =>  >>  >>  Panel SYSTEM" | lolcat
echo -e  "  $bl║ " | lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║               Exit Panel Just Press Enter                  ║" | lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║           Copyright © 2022 by Github.com/syapik96          ║" | lolcat
echo -e  "  ║            🔰Auto-Script is Powered by PRINCE.🔰           ║" | lolcat
echo -e  "  ╚════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "\e[1;31m"
read -p  "           Select From Options :  " menu
echo -e  "\e[0m"
case $menu in
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
        system
        exit
        ;;
        *)
        sudo -i
        exit
        ;;
 esac
