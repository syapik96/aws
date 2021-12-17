#!/bin/bash

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

clear
figlet -f slant "Panel V2RAY" | lolcat
echo ""
echo -e " ╔═══════════════════════════════════════╗" | lolcat
echo -e " ║            Section  V2RAY             ║" | lolcat
echo -e " ╠═══════════════════════════════════════╝" | lolcat
echo -e " $bd║\e[m"
echo -e " $bd║\e[m 1$bl]\e[m$bd Create Vmess Websocket Account"
echo -e " $bd║\e[m 2$bl]\e[m$bd Delete Vmess Websocket Account"
echo -e " $bd║\e[m 3$bl]\e[m$bd Renew Vmess Account"
echo -e " $bd║\e[m 4$bl]\e[m$bd Check User Login Vmess"
echo -e " $bd║\e[m"
echo -e " $bd║\e[m   0 $bl]\e[m$bd MENU    x $bl]\e[m$bd Exit"
echo -e " $bd║\e[m"
echo -e " ╠═══════════════════════════════════════╗" | lolcat
echo -e " ║    COPYRIGHT 2021 OnePieceVPN Inc     ║" | lolcat
echo -e " ╚═══════════════════════════════════════╝" | lolcat
echo -e "\e[1;31m"
read -p "    Please select an option :  "  v2ray
echo -e "\e[0m"
case $v2ray in
    1)
    clear
    addws
    exit
    ;;
    2)
    clear
    delws
    exit
    ;;
    3)
    clear
    renewws
    exit
    ;;
    4)
    clear
    cekws
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
    *)
    echo -e "\e[1;31mPlease enter an correct number\e[0m"
    clear
    exit
    ;;
esac
