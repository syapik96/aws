#!/bin/bash
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
read -rp "Email Untuk link backup: " -e Email
email=${Email}
echo -e "Membuat Directory"
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/premium-script/ backup/premium-script
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
echo -e "Berikut ini adalah link file backup data vps anda.

$link

Jika Ingin Merestore Data Harap Masukkan Link Diatas.

Terimakasih Telah Menggunakan Layanan Kami" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo Done
