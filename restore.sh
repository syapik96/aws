#!/bin/bash
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
cp -r wireguard /etc/
cp chap-secrets /etc/ppp/
cp passwd1 /etc/ipsec.d/passwd
cp ss.conf /etc/shadowsocks-libev/ss.conf
cp -r premium-script /var/lib/
cp -r sstp /home/
cp -r trojan /etc/
cp -r v2ray /etc/
cp -r shadowsocksr /usr/local/
cp -r public_html /home/vps/
strt
rm -rf /root/backup
rm -f backup.zip
echo Done
