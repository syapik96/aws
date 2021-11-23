#!/bin/bash
# Script Mod by OnePiece
clear
echo -e ""
echo -e  "  ╔═══════════════════════════════════════╗" | lolcat
echo -e  "  ║        Renew Account Section          ║" | lolcat
echo -e  "  ╚═══════════════════════════════════════╝" | lolcat
read -p "         Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "         Day Extend     :  " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo -e  " ╔═════════════════════════════════════════╗" | lolcat
echo -e  " ║          Account Updated Info           ║" | lolcat
echo -e  " ╚═════════════════════════════════════════╝" | lolcat
echo -e ""
echo -e "    \e[1;32mUsername\e[0m        :  $User"
echo -e "    \e[1;32mDays Added\e[0m      :  $Days Days"
echo -e "    \e[1;32mExpires on\e[0m      :  $Expiration_Display"
echo -e ""
echo -e  " ╔═════════════════════════════════════════╗" | lolcat
echo -e  " ║ 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ║" | lolcat
echo -e  " ╚═════════════════════════════════════════╝" | lolcat
else
clear
echo -e "         \e[1;31mERROR !!!! ERROR !!!!\e[0m"
echo -e "========================================"
echo -e ""
echo -e "       Script Mod by OnePiece           "| lolcat
echo -e ""
echo -e "       \e[1;31m Username Doesnt Exist\e[0m    "
echo -e ""
echo -e "========================================"
fi
