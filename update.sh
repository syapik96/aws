#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo "Starting Update ..." | lolcat
# update
cd /usr/bin
rm -f /usr/bin/menu
GitUser="syapik96"
#wget https://github.com/${GitUser}/
wget -O l2tp "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/update1.0.sh"
chmod +x update1.0
update1.0

echo " Successfully Update :"
echo " Successfully Upload **New Menu Section** :"
echo " - Fix minor Bugs"
echo " Reboot 5 Sec"
sleep 5
echo -e "Please rebbot your server"
