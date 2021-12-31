#!/bin/bash
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ###
### Script Update by : t.me/PrinceNewbie ####

red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
NC='\e[0m'

clear
cd
rm /root/domain
rm /etc/v2ray/domain
rm /var/lib/premium-script/ipvps.conf
echo -e "\e[1;105m==========================================================\e[0m"
echo -e ""
echo -e "${red}Ensure the Domain is already routed to cloudflare (proxy off)${NC}"
echo -e "${green}Enter your domain , if you do not currently have a domain"
echo -e "or not route with cloudeflare yet click enter to add again later${NC}"
echo -e ""
echo -e "\e[1;105m==========================================================\e[0m" 
echo -e "${blue}"
read -rp "   Domain / Host : " -e host
echo "IP=$host" > /var/lib/premium-script/ipvps.conf
echo "$host" > /etc/v2ray/domain
echo "$host" > /root/domain
echo -e "${NC}"
