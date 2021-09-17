#!/bin/bash
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear 
figlet -w 40 "Welcome To Menu | lolcat
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

echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                ┃ ONEPIECEVPN - PROJECT ┃                   ║" |lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  " $bl ║               𝑷𝒂𝒏𝒆𝒍-𝑴𝒆𝒏𝒖-𝑷𝒓𝒆𝒎𝒖𝒊𝒎" | lolcat
echo -e  " $bl ║ \e[032;1mCPU Model:\e[0m$bd $cname  "
echo -e  " $bl ║ \e[032;1mNumber Of Cores:\e[0m$bd $cores"
echo -e  " $bl ║ \e[032;1mCPU Frequency:\e[0m$bd $freq MHz"
echo -e  " $bl ║ \e[032;1mTotal Amount Of RAM:\e[0m$bd $tram MB"
echo -e  " $op ║ \e[032;1mSystem Uptime:\e[0m$bd $up"
echo -e  " $op ║ \e[032;1mIsp Name:\e[0m$bd $ISP"
echo -e  " $op ║ \e[032;1mIp Vps:\e[0m$bd $IPVPS"
echo -e  " $op ║ \e[032;1mCity:\e[0m$bd $CITY"
echo -e  " $op ║ \e[032;1mTime:\e[0m$bd $WKT                                        ╥"
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ MENU OPTIONS ┃                     ║" |lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  " $bl ║"
echo -e  " $rd ║\e[m$bd 1$bl]\e[m$bd Panel SSH & OpenVPN Menu                                 ╨"
echo -e  " $gl ║\e[m$bd 2$bl]\e[m$bd Panel Wireguard "
echo -e  " $gl ║\e[m$bd 3$bl]\e[m$bd Panel L2TP & PPTP Account"
echo -e  " $bl ║\e[m$bd 4$bl]\e[m$bd Panel SSR & SS Account"
echo -e  " $bl ║\e[m$bd 5$bl]\e[m$bd Panel V2Ray"
echo -e  " $bl ║\e[m$bd 6$bl]\e[m$bd Panel VLess"
echo -e  " $bl ║\e[m$bd 7$bl]\e[m$bd Panel TRojan                                             ╥"
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ SYSTEM MENU ┃                      ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  " $bl ║"
echo -e  " $mg ║\e[m$bd 8$bl]\e[m$bd Panel Domain Point VPS"
echo -e  " $gl ║\e[m$bd 9$bl]\e[m$bd Webmin Menu"
echo -e  " $gl ║\e[m$bd 10$bl]\e[m$bd Check Usage of VPS Ram" 
echo -e  " $gl ║\e[m$bd 11$bl]\e[m$bd Reboot VPS"
echo -e  " $gl ║\e[m$bd 12$bl]\e[m$bd Speedtest VPS"
echo -e  " $gl ║\e[m$bd 13$bl]\e[m$bd Information Display System" 
echo -e  " $gl ║\e[m$bd 14$bl]\e[m$bd Info Script Auto Install"
echo -e  " $bl ║\e[m$bd 15$bl]\e[m$bd Restart All Service"
echo -e  " $bl ║\e[m$bd 16$bl]\e[m$bd Change Banner"  
echo -e  " $bl ║\e[m$bd 17$bl]\e[m$bd Update"                               
echo -e  "  ╠════════════════════════════════════════════════════════════╣\e[m" | lolcat
echo -e  "  ║   0) Exit Menu .                                           ║\e[m" | lolcat
echo -e  "  ║      COPYRIGHT ONEPIECEVPN, POWERED BY PRINCENEWBIE.       ║\e[m" | lolcat
echo -e  "  ╚════════════════════════════════════════════════════════════╝\e[m" | lolcat
echo -e  ""
read -p  "     Please select an option :  " menu
echo -e   ""
while true; do
 case $menu in
   1)
   ssh
   ;;
   2)
   wgr
   ;;
   3)
   l2tp
   ;;
   4)
   ssssr
   ;;
   5)
   v2raay
   ;;
   6)
   vleess
   ;;
   7)
   trojaan
   ;;
   8)
   add-dns
   ;;
   9)
   webmin
   ;;
   10)
   ram
   ;;
   11)
   reboot
   ;;
   12)
   speedtest
   ;;
   13)
   info
   ;;
   14)
   about
   ;;
   15)
   restart
   ;;
   16)
   nano /etc/issue.net
   ;;
   15)
   update
   ;;
   0)
   exit
   ;;
   *)
   echo  "Please enter an correct number"
   ;;
  esac
done
