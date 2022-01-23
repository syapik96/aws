#!/bin/bash
# Updated by Prince

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo -e "==================================" | lolcat
echo -e "  \e[1;32mPlease enter your email (gmail)"
echo -e "  to save your backup files\e[0m"
echo -e "==================================" | lolcat
echo -e ""
read -rp "Email: " -e email
cat > /home/email <<EOF
$email
EOF
fi
cat > /etc/crontab <<EOF
# BEGIN_Backup
5 0 * * * root bckp
# END_Backup
EOF
service cron restart
sleep 1
echo " Please Wait"
sleep 1
clear
echo " Autobackup Has Been Started"
echo " Data Will Be Backed Up Automatically at 05:00 GMT +8"
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Backup/,/^# END_Backup/d" /etc/crontab
service cron restart
sleep 1
echo " Please Wait"
clear
echo " Autobackup Has Been Stopped"
exit 0
}
clear
echo -e " ==============================" | lolcat
echo -e "         Autobackup Data       " | lolcat
echo -e " ==============================" | lolcat
echo -e "  Status \e[1;31m$sts\e[0m "
echo -e ""
echo -e "  1. Start Autobackup"
echo -e "  2. Stop Autobackup"
echo -e " "
echo -e " \e[1;31mPress CTRL+C\e[0m to return"
echo -e " ==============================" | lolcat
echo -e "\e[1;32m"
read -rp " Please Enter The Correct Number : " -e num
echo -e "\e[0m"
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo -e "\e[1;31mInvalid key !! Please Enter The Correct Number\e[0m"
menu
fi
