#!/bin/bash
# Mod Has been updated by Prince 
# 2022
# ==================================================

GitUser="syapik96"
#wget https://github.com/${GitUser}/
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=US
state=California
locality=San Jose
organization=GilerGames, Inc
organizationalunit=GilerGames, Inc
commonname=server
email=admin@gilerspeednet.tk

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/${GitUser}/aws/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd /root/

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# set repo
#sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
#apt-get install gnupg gnupg1 gnupg2 -y
# You may change its webmin version depends on the link you've loaded in this variable(.deb file only, do not load .zip or .tar.gz file):
sudo apt-get install apt-transport-https gnupg2 curl
sudo echo "deb https://download.webmin.com/download/repository sarge contrib" \ > /etc/apt/sources.list.d/webmin.list
curl https://download.webmin.com/jcameron-key.asc | sudo apt-key add -

#update
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

# install wget and curl
apt-get -y install wget curl

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Singapore /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get install -y --fix-missing bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git
echo "clear" >> .profile
echo "prince" >> .profile

# install webserver
# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/syapik96/aws/main/nginx.conf"

Index_port='81'
IPADDR=$(wget -qO- icanhazip.com);
# creating page download Openvpn config file
mkdir -p /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/syapik96/aws/main/lain2/index.html"

# Setting template's correct name,IP address and nginx Port Page Openvpn
sed -i "s|NGINXPORT|$Index_port|g" /home/vps/public_html/index.html
sed -i "s|IP-ADDRESS|$IPADDR|g" /home/vps/public_html/index.html

# mkdir -p /home/vps/public_html
# echo "<pre>Setup Mod Updated By Prince@syapik96</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/${GitUser}/aws/main/vps.conf"
# openport 81 for page /home/vps/public_html/index.html
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 81 -j ACCEPT
sudo netfilter-persistent save
/etc/init.d/nginx restart

# install badvpnCDN
cd $HOME
wget https://github.com/ambrop72/badvpn/archive/refs/tags/1.999.130.zip
unzip 1.999.130.zip
cd 1.999.130
mkdir build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
sudo make install

# install badvpn
cd $HOME
rm 1.999.130.zip
# wget -O /usr/bin/badvpn-udpgw "https://github.com/${GitUser}/aws/raw/main/badvpn-udpgw64"
# chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 40000/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/${GitUser}/aws/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://github.com/vergoh/vnstat/releases/download/v2.8/vnstat-2.8.tar.gz
tar zxvf vnstat-2.8.tar.gz
cd vnstat-2.8
./configure --prefix=/usr --sysconfdir=/etc && make && make install 
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
sed -i 's/Interface "'""""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.8.tar.gz 
rm -rf /root/vnstat-2.8

# install webmin
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<EOF
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 445
connect = 127.0.0.1:109

[dropbear]
accept = 777
connect = 127.0.0.1:33

[ws-ssl]
accept = 443
connect = 700

[ws-openvpn]
accept = 992
connect = 2099

[openvpn]
accept = 442
connect = 127.0.0.1:1194
EOF

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#Matikan OpenVPN
wget https://raw.githubusercontent.com/${GitUser}/aws/main/install/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# xml parser
cd /root/
apt install -y libxml-parser-perl

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/${GitUser}/aws/main/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

#install bbr dan optimasi kernel
wget -0 https://raw.githubusercontent.com/${GitUser}/aws/main/bbr.sh && chmod +x bbr.sh && ./bbr.sh
wget -O https://raw.githubusercontent.com/${GitUser}/aws/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/${GitUser}/aws/main/tambah/add-host.sh"
wget -O about "https://raw.githubusercontent.com/${GitUser}/aws/main/about.sh"
wget -O prince "https://raw.githubusercontent.com/${GitUser}/aws/main/prince.sh"
wget -O menu "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/menusshonly.sh"
wget -O usernew "https://raw.githubusercontent.com/${GitUser}/aws/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/${GitUser}/aws/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/hapus.sh"
wget -O member "https://raw.githubusercontent.com/${GitUser}/aws/main/member.sh"
wget -o webmin "https://raw.githubusercontent.com/${GitUser}/aws/main/webmin.sh"
wget -O delete "https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/delete.sh"
wget -O cek "https://raw.githubusercontent.com/${GitUser}/aws/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/${GitUser}/aws/main/restart1.sh"
wget -O speedtest "https://github.com/${GitUser}/aws/raw/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/${GitUser}/aws/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/${GitUser}/aws/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/${GitUser}/aws/main/renew.sh"
wget -O autokick "https://raw.githubusercontent.com/${GitUser}/aws/main/autokick.sh"
wget -O ceklim "https://raw.githubusercontent.com/${GitUser}/aws/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/${GitUser}/aws/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/${GitUser}/aws/main/clear-log.sh"
wget -O system "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/system00.sh"

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab

chmod +x add-host
chmod +x prince
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x webmin
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x system

# remove unnecessary files
apt -y autoclean
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt -y autoremove

# finishing
cd 
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/webmin restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

history -c
echo "unset HISTFILE" >> /etc/profile

cd /root/
rm -f /root/hanyassh.sh

# finihsing
clear
neofetch
netstat -nutlp
