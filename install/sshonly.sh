#!/bin/bash
#GitUser="syapik96"
#wget https://github.com/${GitUser}/

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

MYIP=$(wget -qO- icanhazip.com);

if [ "${EUID}" -ne 0 ]; then
echo "${red}You need to run this script as root${NC}"
exit 1
fi

if [[ ! -e /var/lib/premium-script ]]; then
rm -rf /var/lib/premium-script
mkdir /var/lib/premium-script
else
mkdir /var/lib/premium-script
#touch /var/lib/premium-script/ipvps.conf
fi

clear
echo -e "\e[1;32mMasukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo -e "Ketikkan Perintah addhost setelah proses instalasi Script Selesai\e[0m"
echo -e "\e[1;31m"
read -p "Hostname / Domain: " host
echo -e "\e[0m"
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /root/domain
GitUser="syapik96"
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/hanyassh.sh && chmod +x hanyassh.sh && screen -S hanyassh.sh ./hanyassh.sh
wget https://raw.githubusercontent.com/${GitUser}/aws/main/websocketsshonly.sh && chmod +x websocketsshonly.sh && screen -S websocketsshonly.sh ./websocketsshonly.sh
rm -f /root/hanyassh.sh
rm -f /root/websocketsshonly.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Script Mod Prince96-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22, 500, X40000"  | tee -a log-install.txt
echo "   - SSH-WS Python OpenSSH    : 100"  | tee -a log-install.txt
echo "   - SSH-WS Python Dropbear   : 80"  | tee -a log-install.txt
echo "   - SSH-WS Python SSL/TLS    : 443"  | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 99, X30000"  | tee -a log-install.txt
echo "   - Dropbear                 : 143, 109, X50000"  | tee -a log-install.txt
echo "   - Badvpn                   : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                    : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +8" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------------------------------Mod by Prince96------------------------------------------" | tee -a log-install.txt
echo "Installation Success"
echo " Reboot in 5 Sec"
sleep 5
reboot
