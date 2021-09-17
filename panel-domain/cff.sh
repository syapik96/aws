#!/bin/bash

cd /root
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
echo "Your ID Cloudflare"
echo -e "===============================" | lolcat
echo "DOMAIN         : $domain"
echo "Email          : $email"
echo "Api Key        : $key"
echo -e "===============================" | lolcat
