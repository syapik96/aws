#!/bin/bash
# updated Add cloudflare section

cd 
rm /root/mail2.txt  /root/mail3.txt  /root/mail4.txt
figlet -f standard "Cloudflare" | lolcat
echo ""
echo -e " ---Add ID Cloudlare--- " | lolcat
echo ""
read -p " Masukan Domain : " domain
read -p " Masukan Email Cloudflare :" email
read -p " Masukan Api Key :" key
echo "$domain" >> /root/mail2.txt
echo "$email" >> /root/mail3.txt
echo "$key" >> /root/mail4.txt
clear
domain=$(cat /root/mail2.txt)
email=$(cat /root/mail3.txt)
key=$(cat /root/mail4.txt)
figlet -f standard "Succesfully" | lolcat
echo ""
echo -e "Your NewID Cloudflare" | lolcat
echo -e "===============================" | lolcat
echo -e " DOMAIN         : $domain"
echo -e " Email          : $email"
echo -e " Api Key        : $key"
echo -e "===============================" | lolcat
read -p " Enter 0 back menu : " HH
case $HH in
    0)
    clear
    menu
    exit
    ;;
 esac   
