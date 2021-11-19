#!/bin/bash
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ###
### Script Update by : t.me/PrinceNewbie ####

echo -e "\e[1;31m PASTIKAN DOMAIN SUDAH POINTING IP VPS ANDA \e[0m"
echo -e "\e[1;31mJika Tiada domain sila Create Domain dahulu" 
echo -e "Contonya di Freenom(free) \e[0m" 

read -rp "Domain/Host: " -e host
echo "IP=$host" > /var/lib/premium-script/ipvps.conf

