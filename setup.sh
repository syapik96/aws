#!/bin/bash
# Script mod updated By Prince
# Commad Install auto setup was changed 
# due to an error while performing the installation
# ==============================
#    ! HAPPY NEW YEAR GUYSS !
# ==============================

red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
NC='\e[0m'

if [ "${EUID}" -ne 0 ]; then
    echo -e "${red}You need to run this script as root user${NC}"
    exit 1
 fi

#make update before start installing ,
#for ensure if forgot update vps
apt-get update -y
apt-get upgrade -y
apt dist-upgrade -y
# install wget and curl
apt -y install wget curl
apt-get install screen -y

clear
cd
# Check Script
if [[ ! -e /etc/v2ray ]]; then
    echo -e "${red}        Auto-Script already installed${NC}"
    echo -e "${red}Make sure to install this script on a fresh vps only${NC}"
    echo -e "${red}      to avoid problems when installing${NC}"
    sleep 5
    exit 1
else
    mkdir /etc/v2ray
fi
mkdir /var/lib/premium-script;
echo -e ""
echo -e "\e[1;104m==========================================================\e[0m"
echo -e ""
echo -e "${red}Ensure the Domain is already routed to cloudflare with proxy off${NC}"
echo -e "${green}Enter your domain , if you do not currently have a domain"
echo -e "or not route with cloudeflare yet click enter to add again later${NC}"
echo -e ""
echo -e "\e[1;104m==========================================================\e[0m"
echo -e ""
echo -e "\e[1;104m==========================================================\e[0m"
echo -e "\e[1;33m"
read -rp "    Enter your Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" > /etc/v2ray/domain
echo "$host" > /root/domain
echo -e "\e[0m"
echo -e "\e[1;104m==========================================================\e[0m"
sleep 1
clear
echo -e "\e[1;33mDomain saved successfully\e[0m"
sleep 1
clear
echo -e "\e[1;104m==========================================================\e[0m"
echo -e ""
echo -e "\e[1;32mThe script will start running the installation in 2sec${NC}"
echo -e ""
echo -e "\e[1;104m==========================================================\e[0m"
sleep 2

GitUser="syapik96"
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket ./websocket.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/shadowsocksobfs.sh && chmod +x shadowsocksobfs.sh && screen -S shadowsocksobfs ./shadowsocksobfs.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh

# Remove script has installed
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /root/shadowsocksobfs.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh

history -c
echo "1.1" > /home/ver

clear
#figlet -f slant "Installation Completed !" | lolcat
figlet -f slant "! HAPPY NEW YEAR GUYSS !" | lolcat
echo  " "
echo -e "===============-${green}AutoScript by PrinceNewbie${NC}-======================" | tee -a log-install.txt
echo -e "                ${green}Public Free Premium Script${NC}" | tee -a log-install.txt
echo -e "-------------------\e[1;32m\e[1;104mMod Updated by Prince\e[0m------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "     [       Service        ]   [  Port  ]"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22,777 X40000"  | tee -a log-install.txt
echo "   - SSH-WS Python OpenSSH    : 100,"  | tee -a log-install.txt
echo "   - SSH-WS Python Dropbear   : 80"  | tee -a log-install.txt
echo "   - SSH-WS Python SSL/TLS    : 443"  | tee -a log-install.txt
echo "   - OpenVPN-WS Python        : 445"  | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 992, X1197"  | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 442, 110"  | tee -a log-install.txt
echo "   - Dropbear                 : 143,109, 69, X50000" | tee -a log-install.txt
echo "   - Squid Proxy              : 3128,8080,8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900"  | tee -a log-install.txt
echo "   - Nginx                    : 81(port download openvpn config)"  | tee -a log-install.txt
echo "   - Wireguard                : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN           : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                 : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                 : 5555"  | tee -a log-install.txt
echo "   - Shadowsocks-R            : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS              : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP             : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS          : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS     : 880"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS          : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS     : 2052"  | tee -a log-install.txt
echo "   - Trojan Go                : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Singapore(GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +8" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "---------------------\e[1;32m\e[1;104mCopyright 2022 @ Prince Newbie\e[0m-------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e " Telegram : t.me/PrinceNewbie" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo -e "${red} Reboot in 10 Sec${NC}"
sleep 10
reboot
