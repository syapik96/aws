#!/bin/bash

cd /root
rm /root/mail.confconf 
figlet "Cloudflare" | lolcat

echo "Name : Add ID Cloudlare " | lolcat
echo ""
read -e -p " Masukan Domain :$domain" domain
read -e -p " Masukan Email Cloudflare :" email
read -e -p " Masukan Api Key :" key
echo -e "domain=$domain" >> /root/mail.conf
echo -e "email=$email" >> /root/mail.conf
echo -e "key=$key" >> /root/mail.conf
clear
echo "Done"
echo -e "Your ID Cloudflare"
echo -e "===============================" | lolcat
echo -e "DOMAIN         : $domain"
echo -e "Email          : $email"
echo -e "Api Key        : $key"
echo -e "===============================" | lolcat
