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
wget -O l2tp "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/l2tp.sh"
wget -O ssh "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/ssh.sh"
wget -O ssssr "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/ssssr.sh"
wget -O trojaan "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/trojaan.sh"
wget -O v2raay "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/.sh"
wget -O wgr "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/wgr.sh"
wget -O vleess "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/vleess.sh"
wget -O cfd "https://raw.githubusercontent.com/${GitUser}/aws/main/panel-domain/cfd.sh"
wget -O cff "https://raw.githubusercontent.com/${GitUser}/aws/main/panel-domain/cff.sh"
wget -O cfh "https://raw.githubusercontent.com/${GitUser}/aws/main/panel-domain/cfh.sh"
wget -O add-dns "https://raw.githubusercontent.com/${GitUser}/aws/main/panel-domain/add-dns.sh"
wget -O menu "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/menu.sh"

chmod +x l2tp
chmod +x ssh
chmod +x ssssr
chmod +x trojaan
chmod +x v2raay
chmod +x wgr
chmod +x vleess
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x add-dns
chmod +x menu

echo " Successfully Update :"
echo " Successfully Upload **New Menu Section** :"
echo " - Fix minor Bugs"
echo " Reboot 5 Sec"
sleep 5
echo -e "Please rebbot your server"
