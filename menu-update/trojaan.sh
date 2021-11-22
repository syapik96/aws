#!/bin/bash

clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

figlet -f slant "PANEL TROJAN" | lolcat
echo -e ""
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║           Section  TROJAN             ║" | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " $bd║\e[0m"
echo -e " ║ 1$bl]\e[m$bd Create Trojan Account"
echo -e " ║ 2$bl]\e[m$bd Deleting Trojan Account"
echo -e " ║ 3$bl]\e[m$bd Renew Trojan Account"
echo -e " ║ 4$bl]\e[m$bd Check User Login Trojan"
echo -e " $bd║\e[0m"
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                     ║"   | lolcat
echo -e " ╠═══════════════════════════════════════╣" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  "  trojan
echo -e "\e[0m"
case $trojan in
      1)
      clear
      addtr
      exit
      ;;
      2)
      clear
      deltr
      exit
      ;;
      3)
      clear
      renewtr
      exit
      ;;
      0)
      clear
      menu
      exit
      ;;
      *)
      echo "${red}Please enter an correct number${NC}"
      sleep 3
      clear
      trojaan
      exit
      ;;
  esac
