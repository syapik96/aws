#!/bin/bash
# Script By syapik96
# ==================================================


if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
clear
echo "Masukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo "Ketikkan Perintah addhost setelah proses instalasi Script Selesai"
read -p "Hostname / Domain: " host
echo "IP=$host" > /var/lib/premium-script/ipvps.conf
echo "$host" > /etc/v2ray/domain
echo "$host" > /root/domain
#GitUser="syapik96"
#wget https://github.com/${GitUser}/
GitUser="syapik96"
#wget https://raw.githubusercontent.com/${GitUser}/aws/main/add-host.sh && chmod +x add-host.sh && screen -S add-host.sh ./add-host.sh
#wget https://raw.githubusercontent.com/${GitUser}/aws/main/tambah/addhost.sh && chmod +x addhost.sh && screen -S addhost.sh ./addhost.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/shadowsocksobfs.sh && chmod +x shadowsocksobfs.sh && screen -S ss ./shadowsocksobfs.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
#rm -f /root/add-host.sh
#rm -f /root/addhost.sh
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /root/shadowsocksobfs.sh
rm -f /root/ins-vt.sh
rm -f /root/go.sh
rm -f /root/ipsec.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "===========================-AutoScript by PrinceNewbie-=========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22, X40000"  | tee -a log-install.txt
echo "   - SSH-WS Python OpenSSH    : 100"  | tee -a log-install.txt
echo "   - SSH-WS Python Dropbear   : 2020, 2021"  | tee -a log-install.txt
echo "   - SSH-WS Python SSL/TLS    : 5052, 5053"  | tee -a log-install.txt
echo "   - OpenVPN-WS Python        : 6969"  | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 992, X1197"  | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 443, X30000"  | tee -a log-install.txt
echo "   - Dropbear                 : 143, 109, X50000"  | tee -a log-install.txt
echo "   - Squid Proxy              : 3128, 8080, 8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                   : 7100, 7200, 7300, 7400, 7500"  | tee -a log-install.txt
echo "   - Nginx                    : 81"  | tee -a log-install.txt
echo "   - Wireguard                : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN           : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                 : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                 : 5555"  | tee -a log-install.txt
echo "   - Shadowsocks-R            : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS              : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP             : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS          : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS     : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS          : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS     : 2052"  | tee -a log-install.txt
echo "   - Trojan                   : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Singapore (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +8" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------------------------------Mod by WHY------------------------------------------" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo " Username Telegram : @PrinceNewbie" | tee -a log-install.txt
echo "" | tee -a log-install.txt
# OPEN PORT ORACLE CLOUD
IP=$(wget -qO- icanhazip.com);
iptables -A INPUT -s $IP/32 -p tcp -m multiport --dports 1:65535 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 5052 -j ACCEPT
netfilter-persistent save
netfilter-persistent reload
echo ""
echo " Reboot 10 Sec"
sleep 10
reboot
