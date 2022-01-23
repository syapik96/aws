#!/bin/bash
#
# ===========================

IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
echo ""
echo "#######################################" | lolcat
echo ""
echo "  \e[1;32mEnter Your Email To Receive Message\e[0m"
echo ""
echo "########=[ POWERED BY PRINCE ]=########" | lolcat
echo "\e[1;31"
read -rp " Email: " -e email
echo "\e[0m"
sleep 1
echo -e " \e[1;31mCreating  Directory Backup"
mkdir /root/backup
sleep 1
echo -e " \e[1;31mStart Backup\e[0m"
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/crot-script/ backup/crot-script
cp -r /home/sstp backup/sstp
cp -r /etc/v2ray backup/v2ray
cp -r /etc/trojan backup/trojan
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file.

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "Done"
echo "Please Check Your Email"
