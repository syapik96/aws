#!/bin/bash
# Script Updated , Copyright * 2021
# Premium Script by t.me/PrinceNewbie

if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi

clear

RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'

sysctl -w net.ipv6.conf.all.disable_ipv6 = 1
sysctl -w net.ipv6.conf.default.disable_ipv6 = 1
timedatectl set-timezone Asia/Kuala_Lumpur
apt-get update && apt-get upgrade -y 
apt install -y bzip2 gzip coreutils screen curl
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat -y

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf

echo -e " Untuk Menjalankan Auto Install Script Ini"
echo -e " Anda Harus Mengisi Borang terlebih Dahulu "
echo -e " Downloading 20%"
echo -e " Downloading 40%"
echo -e " Downloading 80%"
echo -e " Downloading 100%"
sleep 0.5
clear
echo -e " ---Borang ID Cloudlare--- " | lolcat
echo -e ""
read -p " Masukan Domain : " domain
read -p " Masukan Email Cloudflare :" email
read -p " Masukan Api Key :" key
echo "$domain" >> /root/mail2.txt
echo "$email" >> /root/mail3.txt
echo "$key" >> /root/mail4.txt

echo -e " Starting Installation AutoScript "
echo -e "1"
echo -e "2"
echo -e "3"

GitUser="syapik96"
#wget https://github.com/${GitUser}/

wget https://raw.githubusercontent.com/${GitUser}/aws/main/add-host.sh && chmod +x add-host.sh && screen -S add-host ./add-host.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/shadowsocksobfs.sh && chmod +x shadowsocksobfs.sh && screen -S ss ./shadowsocksobfs.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh

rm -f /root/add-host.sh
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /root/shadowsocksobfs.sh
rm -f /root/ins-vt.sh
rm -f /root/go.sh
rm -f /root/ipsec.sh

cat > /etc/systemd/system/autosett.service <<EOF
[Unit]
Description=autosetting
Documentation=https://trickinternetvpns.ml
[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target

EOF
systemctl daemon-reload
systemctl enable autosett

history -c
echo "1.1.1" > /home/ver
clear
figlet -f slant OnePieceVPN | lolcat
echo " "
echo " "
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service Port" | tee -a log-install.txt
echo "   - OpenSSH                 : 22" | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442" | tee -a log-install.txt
echo "   - Stunnel4                : 567, 443" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - WebSocket Dropbear      : 8880" | tee -a log-install.txt
echo "   - WebSocket OpenSSH       : 2095" | tee -a log-install.txt
echo "   - WebSocket OpenVPN       : 2082" | tee -a log-install.txt
echo "   - WebSocket TLS           : 222" | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP SSH)" | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - Wireguard               : 7070" | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701" | tee -a log-install.txt
echo "   - PPTP VPN                : 1732" | tee -a log-install.txt
echo "   - SSTP VPN                : 444" | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543" | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543" | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543" | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443" | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083" | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 2052" | tee -a log-install.txt
echo "   - Trojan                  : 2087" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Server Information & Other Features" | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala Lumpur (GMT +8)" | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]" | tee -a log-install.txt
echo "   - Dflate                  : [ON]" | tee -a log-install.txt
echo "   - IPtables                : [ON]" | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]" | tee -a log-install.txt
echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
echo "   - Autoreboot On 00.00-12.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt
echo "- OnePieceVPN " | tee -a log-install.txt
echo ""
sleep 1
if [! -e /root/log-install.txt]; then
echo -e "Setup Install Ralat! Sistem Jalan Setup Install Semula" | lolcat
sleep 0.5
wget https://raw.githubusercontent.com/${GitUser}/aws/main/log.sh && chmod +x log.sh && ./log.sh
else
    echo -e "Setup Install Sukses!" | lolcat
fi
echo " Reboot 10 Saat"
sleep 10
rm setup.sh
reboot

