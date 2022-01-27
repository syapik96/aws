#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

clear
figlet -f standard "Panel Wireguard" | lolcat
echo -e ""
echo -e " ╠════════════════════════════════╣" | lolcat
echo -e " ║            PANEL WIREGUARD                          ║" | lolcat
echo -e " ╠════════════════════════════════╣" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Wireguard Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Delete Wireguard Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Check User Login Wireguard"
echo -e " $bd║\e[m 4$bl]\e[m$bd Renew Wireguard Account"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════╣" | lolcat
echo -e " ║  0]  RETURN  MENU                                  ║"   | lolcat
echo -e " ╠═══════════════════════════════╣" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  " wgg
echo -e "\e[0m"
case $wgg in
    1)
    clear
    addwg
    exit
    ;;
    2)
    clear
    delwg
    exit
    ;;
    3)
    clear
    cekwg
    exit
    ;;
    4)
    clear
    renewwg
    exit
    ;;
    0)
    clear
    menu
    exit
    ;;
    *)
    echo -e "${red}Please enter an correct number${NC}"
    sleep 2
    wgr
    ;;
esac
