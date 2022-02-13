#!/bin/bash
# updated by syapik96
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
red='\e[1;31m'
NC='\e[0m'
clear
figlet -f slant "PANEL TROJAN" | lolcat
echo -e ""
echo -e  "  ╔════════════════════════╗" | lolcat
echo -e  "  ║               TROJAN                   ║" | lolcat
echo -e  "  ╠════════════════════════╝" | lolcat
echo -e  "  ║" | lolcat
echo -e  "  ║  1$bl]\e[m$bd Create Trojan Account"
echo -e  "  ║  2$bl]\e[m$bd Deleting Trojan Account"
echo -e  "  ║  3$bl]\e[m$bd Renew Trojan Account"
echo -e  "  ║  4$bl]\e[m$bd Check User Login Trojan"
echo -e  "  ║" | lolcat
echo -e  "  ║     0 ] Menu      x ] Exit" |  lolcat              
echo -e  "  ║" | lolcat
echo -e  "  ╠════════════════════════╗" | lolcat
echo -e  "  ║    COPYRIGHT 2021 OnePieceVPN Inc      ║" | lolcat
echo -e  "  ╚════════════════════════╝" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  " trojann1
echo -e "\e[0m"
echo ""
case $trojann1 in
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
      4)
      clear
      cektr
      exit
      ;;
      0)
      clear
      menu
      exit
      ;;
      x)
      clear
      echo -e ""
      figlet -f slant " Good Bye " | lolcat
      echo -e ""
      sleep 2
      clear
      prince
      exit
      *)
      echo -e "${red}Please enter an correct number${NC}"
      clear
      exit
      ;;
  esac

