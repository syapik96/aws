#!/bin/bash

clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

echo -e ""
figlet "Panel Vless" | lolcat
echo ""
echo -e " ╔═══════════════════════════════════════╗" | lolcat
echo -e " ║                Vless                  ║"   | lolcat                
echo -e " ╠═══════════════════════════════════════╝" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Vless Websocket Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Deleting Vless Websocket Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Renew Vless Account "
echo -e " $bd║\e[m 4$bl]\e[m$bd Check User Login Vless"
echo -e " $bd║\e[m"
echo -e " ║      0 ] Menu      x ] Exit" |  lolcat              
echo -e " ║" | lolcat
echo -e " ╠═══════════════════════════════════════╗" | lolcat
echo -e " ║    COPYRIGHT 2021 OnePieceVPN Inc     ║" | lolcat
echo -e " ╚═══════════════════════════════════════╝" | lolcat
echo -e "\e[1;31m"
read -p "     Please select an option :  "  vless
echo -e "\e[0m"
case $vless in
      1)
      clear
      addvless
      exit
      ;;
      2)
      clear
      delvless
      exit
      ;;
      3)
      clear
      renewvless
      exit
      ;;
      4)
      clear
      cekvless
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
      echo -e "${red}Please enter an correct number${NC}"
      sleep 2
      clear
      vleess
      exit
      ;;
   esac
