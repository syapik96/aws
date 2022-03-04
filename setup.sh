#!/bin/bash
#


# =================================================
#         Script Mod Modified By Prince 
# Command line auto script setup has been updated
# please and hopelly pull an issue if got an error
# =================================================
#               Modified on 24-1-22
# =================================================


red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
blue='\e[1;34m'
NC='\e[0m'

if [ "${EUID}" -ne 0 ]; then
    echo -e "${red}You need to run this script as root user${NC}"
    exit 1
 fi

#run update before start installing ,
#for ensure if forget update
apt-get update -y
apt-get upgrade -y
apt dist-upgrade -y

# install wget and curl
apt -y install wget curl
apt-get install screen -y 

# remove any old and not use 
apt-get autoclean && apt-get autoremove -y

clear
cd
# Checking VPS ( if fresh or used vps before excute another )..
if [[ ! -e /etc/v2ray ]]; then
    echo -e "          ${yellow}Hello Stranger , thanks using my-repo${NC}" 
    echo -e "    ${red}It's seem you have installed kind vpn-script before"
    echo -e "  Auto-Script will remove your current configuration folder"
    echo -e "to avoid problem while auto-script running configuration setup${NC}"
    sleep 5
    rm -rf /etc/v2ray
    cd
    mkdir /etc/v2ray
else
    mkdir /etc/v2ray
fi
if [[ ! -e /var/lib/premium-script/ipvps.conf ]]; then
    echo -e "          ${blue}Hello Stranger , thanks using my-repo${NC}" 
    echo -e "    ${red}It's seem you have installed kind vpn script before"
    echo -e "  Auto-Script will remove your current configuration folder"
    echo -e "to avoid problem while auto-script running configuration setup${NC}"
    sleep 3
    rm -rf /var/lib/premium-script
    echo " system has deleted current /var/lib/premium-script "
    sleep 1
    echo " system create new directory for new auto-script installation"
    sleep 1
    mkdir /var/lib/premium-script
else
    mkdir /var/lib/premium-script
fi
clear
echo -e ""
echo -e "\e[1;104m\e[31m=============================================================================\e[0m"
echo -e ""
echo -e "  ${red}Ensure the Domain is already routed to cloudflare with proxy off${NC}"
echo -e " "
echo -e "  ${yellow}Enter your domain , if you do not currently have a domain"
echo -e "   or not route with cloudflare yet click enter to add again later${NC}"
echo -e ""
echo -e "\e[1;104m\e[31m=============================================================================\e[0m"
echo -e ""
sleep 3
clear
echo -e ""
echo -e "\e[1;104m\e[1;32===================================================================================\e[0m"
echo -e "               ${yellow}Please Enter Domain / Hostname To Start Installation${NC}"
echo -e " If don't have domain you can use IP-ADD instead, but cert v2ray will \e[31mfailed\e[0m issue      " 
echo -e "\e[1;104m\e[1;32===================================================================================\e[0m"
echo -e "\e[1;33m"
read -rp "    Domain/Host: " -e host
echo -e "\e[0m"
domain="$host"
echo "IP=$domain" >> /var/lib/premium-script/ipvps.conf
echo "$domain" >> /etc/v2ray/domain
echo "$domain" >> /root/domain
sleep 2
clear 
echo -e "        ${green}Your Domain / Hostname has been saved${NC}"
echo -e "\e[1;41m==========================================================\e[0m"
echo -e "${yellow}"
echo -e "  The script will start running the installation in 5sec"
echo -e " "
echo -e "   it will take 5 or 6 min to finish , sit back n relax"
echo -e "${NC}"
echo -e "\e[1;41m==========================================================\e[0m"
sleep 3
clear 
cd
GitUser="syapik96"
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn.sh ./ssh-vpn.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/sstp.sh && chmod +x sstp.sh && screen -S sstp.sh ./sstp.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/wg.sh && chmod +x wg.sh && screen -S wg.sh ./wg.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ssr.sh && chmod +x ssr.sh && screen -S ssr.sh ./ssr.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/shadowsocksobfs.sh && chmod +x shadowsocksobfs.sh && screen -S shadowsocksobfs.sh ./shadowsocksobfs.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' /root/ins-vt.sh && screen -S v2ray.sh ./ins-vt.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec.sh ./ipsec.sh

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
echo "2.1" >> /home/ver

clear
figlet -f slant "Installation has Finish  !" | lolcat
sleep 2
clear 
figlet -f slant "Server Will Reboot in 10sec" | lolcat
echo  " "
echo -e "=================-AutoScript VPN-Batch-====================" | lolcat  | tee -a log-install.txt
echo -e "\e[1;31m -----------------\e[0m\e[1;32m[\e[0m \e[1;43m\e[1;31mModified by Prince\e[0m \e[1;32m]\e[0m\e[1;31m------------------\e[0m" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "    \e[31m[\e[0m\e[1;42m       Service        \e[0m\e[31m]   [\e[0m\e[1;42m   Port   \e[0m\e[31m]\e[0m" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   - OpenSSH                  : 22,777 X40000" | tee -a log-install.txt
echo "   - SSH-WS Python OpenSSH    : 100," | tee -a log-install.txt
echo "   - SSH-WS Python Dropbear   : 80" | tee -a log-install.txt
echo "   - SSH-WS Python SSL/TLS    : 443" | tee -a log-install.txt
echo "   - OpenVPN-WS Python        : 2099" | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 442" | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 445, 110" | tee -a log-install.txt
echo "   - Dropbear                 : 143,109, 69" | tee -a log-install.txt
echo "   - Squid Proxy              : 3128,8080,8000 (limit to IP Server)" | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                    : 81(port download openvpn config)" | tee -a log-install.txt
echo "   - Wireguard                : 7070" | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN           : 1701" | tee -a log-install.txt
echo "   - PPTP VPN                 : 1732" | tee -a log-install.txt
echo "   - SSTP VPN                 : 5555" | tee -a log-install.txt
echo "   - Shadowsocks-R            : 1443-1543" | tee -a log-install.txt
echo "   - SS-OBFS TLS              : 2443-2543" | tee -a log-install.txt
echo "   - SS-OBFS HTTP             : 3443-3453" | tee -a log-install.txt
echo "   - V2RAY Vmess TLS          : 8443" | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS     : 880" | tee -a log-install.txt
echo "   - V2RAY Vless TLS          : 2083" | tee -a log-install.txt
echo "   - V2RAY Vless None TLS     : 2052" | tee -a log-install.txt
echo "   - Trojan Go                : 2087" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "   >>> \e[1;42mServer Information & Other Features\e[0m" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Timezone                : Asia/Singapore (GMT +8)" | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]" | tee -a log-install.txt
echo "   - Dflate                  : [ON]" | tee -a log-install.txt
echo "   - IPtables                : [ON]" | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]" | tee -a log-install.txt
echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Autoreboot On 00.05 GMT +8" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "\e[97m------------\e[0m\e[100m\e[97mCopyright © 2022 \e[1;104mBy Gitub.com/syapik96\e[0m\e[97m-------------\e[0m" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e " Telegram : t.me/PrinceNewbie" | tee -a log-install.txt
echo "" | tee -a log-install.txt
sleep 8
clear 
figlet -f slant "Good Bye By Prince" | lolcat
sleep 2
reboot
