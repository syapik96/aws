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
echo -e " "
echo -e " "
echo -e " " 
figlet -f shadow WelcomeToMenu | lolcat
echo -e " " 
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
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║             Panel Created by PrinceNewBie" | lolcat
echo -e  " $bl ║"
echo -e  " $bl ║ \e[032;1mCPU Model:\e[0m$bd $cname  "
echo -e  " $bl ║ \e[032;1mNumber Of Cores:\e[0m$bd $cores"
echo -e  " $bl ║ \e[032;1mCPU Frequency:\e[0m$bd $freq MHz"
echo -e  " $bl ║ \e[032;1mTotal Amount Of RAM:\e[0m$bd $tram MB"
echo -e  " $op ║ \e[032;1mSystem Uptime:\e[0m$bd $up"
echo -e  " $op ║ \e[032;1mIsp Name:\e[0m$bd $ISP"
echo -e  " $op ║ \e[032;1mIp Vps:\e[0m$bd $IPVPS"
echo -e  " $op ║ \e[032;1mCity:\e[0m$bd $CITY"
echo -e  " $op ║ \e[032;1mTime:\e[0m$bd $WKT "                                    
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ MENU OPTIONS ┃                     ║" |lolcat
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"
echo -e  " $rd ║\e[m$bd 1$bl]\e[m$bd Panel SSH & OpenVPN Menu"  | lolcat                                
echo -e  " $gl ║\e[m$bd 2$bl]\e[m$bd Panel Wireguard " | lolcat 
echo -e  " $gl ║\e[m$bd 3$bl]\e[m$bd Panel L2TP & PPTP Account" | lolcat
echo -e  " $bl ║\e[m$bd 4$bl]\e[m$bd Panel SSR & SS Account" | lolcat
echo -e  " $bl ║\e[m$bd 5$bl]\e[m$bd Panel V2Ray" | lolcat
echo -e  " $bl ║\e[m$bd 6$bl]\e[m$bd Panel VLess" | lolcat
echo -e  " $bl ║\e[m$bd 7$bl]\e[m$bd Panel TRojan" | lolcat                                           
echo -e  " $bl ║ "                                                                   
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ DOMAIN MENU ┃                      ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"
echo -e  " $bl ║\e[m$bd 8$bl]\e[m$bd Add Subdomain Host For VPS" | lolcat
echo -e  " $bl ║\e[m$bd 9$bl]\e[m$bd Add ID Cloudflare" | lolcat 
echo -e  " $bl ║\e[m$bd 10$bl]\e[m$bd Cloudflare Add-Ons" | lolcat
echo -e  " $bl ║\e[m$bd 11$bl]\e[m$bd Pointing BUG" | lolcat
echo -e  " $bl ║\e[m$bd 12$bl]\e[m$bd Renew Certificate V2RAY" | lolcat
echo -e  " $bl ║"     
echo -e  "  ╠════════════════════════════════════════════════════════════╣" | lolcat
echo -e  "  ║                       ┃ SYSTEM MENU ┃                      ║" | lolcat 
echo -e  "  ╠════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"
echo -e  " $gl ║\e[m$bd 13$bl]\e[m$bd Webmin Menu" | lolcat
echo -e  " $gl ║\e[m$bd 14$bl]\e[m$bd Check Usage of VPS Ram" | lolcat
echo -e  " $gl ║\e[m$bd 15$bl]\e[m$bd Reboot VPS" | lolcat
echo -e  " $gl ║\e[m$bd 16$bl]\e[m$bd Speedtest VPS" | lolcat
echo -e  " $gl ║\e[m$bd 17$bl]\e[m$bd Information Display System" | lolcat
echo -e  " $gl ║\e[m$bd 18$bl]\e[m$bd Info Script Auto Install" | lolcat
echo -e  " $bl ║\e[m$bd 19$bl]\e[m$bd Restart All Service" | lolcat
echo -e  " $bl ║\e[m$bd 20$bl]\e[m$bd Change Banner"  | lolcat
echo -e  " $bl ║"                              
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
   add-host
   ;;
   9)
   cff
   ;;
   10)
   cfd
   ;;
   11)
   cfh
   ;;
   12)
   certv2ray
   ;;
   13)
   webmin
   ;;
   14)
   ram
   ;;
   15)
   reboot
   ;;
   16)
   speedtest
   ;;
   17)
   info
   ;;
   18)
   about
   ;;
   19)
   restart
   ;;
   20)
   nano /etc/issue.net
   ;;
   0)
   exit
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   ;;
  esac
done
