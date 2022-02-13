#!/bin/bash
# Script Mod updated By Prince
# 
# ==================================================

GitUser="syapik96"
#wget https://github.com/${GitUser}/

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=US
state=California
locality=San Jose
organization=Gilergames, Inc
organizationalunit=Gilergames, Inc
commonname=ssh.gilergames.tk
email=admin@gilergames.tk

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/${GitUser}/aws/main/password"
chmod +x /etc/pam.d/common-password

# install
apt update
apt upgrade -y
apt-get upgrade -y
apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y
apt install ruby -y && gem install lolcat
apt-get install figlet -y
apt-get install iptables-persistent

# check package install if missing
sudo apt-get ssl-cert bind9-utils install bzip2 gzip coreutils wget screen rsyslog iftop htop -y
sudo apt-get install -y net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 
sudo apt-get install -y bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git
apt-get install -y --fix-missing 

# go to root
cd
# Edit file /etc/systemd/system/rc-local.service

cat > "/etc/systemd/system/rc-local.service" <<EOF
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
EOF

# nano /etc/rc.local

cat > "/etc/rc.local" <<EOF
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
EOF

# Ubah izin akses
chmod +x /etc/rc.local
# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Singapore /etc/localtime

# set repo
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
apt-get install gnupg gnupg1 gnupg2 -y
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc


# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# set ./bash.rc
echo "clear" >> .profile
echo "prince" >> .profile


# install webserver
apt -y install nginx
cd
#rm /etc/nginx/sites-enabled/default
#rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/syapik96/aws/main/nginx.conf"

Index_port='81'
IPADDR=$(wget -qO- icanhazip.com);
# creating page download Openvpn config file
mkdir -p /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/syapik96/aws/main/lain2/index.html"

# Setting template's correct name,IP address and nginx Port Page Openvpn
sed -i "s|NGINXPORT|$Index_port|g" /home/vps/public_html/index.html
sed -i "s|IP-ADDRESS|$IPADDR|g" /home/vps/public_html/index.html

# Restarting nginx service
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/syapik96/aws/main/vps.conf"
systemctl restart nginx

cd
# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 40000/g' /etc/ssh/sshd_config


# install dropbear
apt-get install dropbear -y
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# install squid
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/${GitUser}/aws/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

#​ Install SSLH 
apt -y install sslh 
​rm -f /etc/default/sslh 
  
​#​ Settings SSLH

​cat ​>​ "/etc/default/sslh" ​<<​-EOF12
​# Default options for sslh initscript 
​# sourced by /etc/init.d/sslh 
  
​# Disabled by default, to force yourself 
# to read the configuration: 
# - /usr/share/doc/sslh/README.Debian (quick start) 
​# - /usr/share/doc/sslh/README, at "Configuration" section 
​# - sslh(8) via "man sslh" for more configuration details. 
# Once configuration ready, you *must* set RUN to yes here 
# and try to start sslh (standalone mode only) 
 
RUN=yes 

# binary to use: forked (sslh) or single-thread (sslh-select) version 
​# systemd users: dont forget to modify /lib/systemd/system/sslh.service 
​DAEMON=/usr/sbin/sslh 

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

EOF12
  
​#​ Restart Service SSLH 
service sslh restart 
systemctl restart sslh 
/etc/init.d/sslh restart 
​/etc/init.d/sslh status 
​/etc/init.d/sslh restart

# setting vnstat
apt-get -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install webmin
apt install webmin -y
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
/etc/init.d/webmin restart

# install stunnel
apt-get install stunnel4 -y
## choose which one work on your vps, [ if u got some issue ]
## after configur or make change stunnel.conf
## and if this three not isn't fixed your pid file issue 
### so u need to locat your pid it been saved 
## not find ,, configur your stunnel.conf until work
## /*/*/stunnel4.pid or /*/*/stunnel.pid
# if use default setup, 1 from this 3 may solve your issue
# pid = /run/stunnel.pid
# pid = /var/run/stunnel.pid
# pid = /var/run/stunnel4.pid

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
connect = 127.0.0.1:22

[ws-ssl]
accept = 443
connect = 700

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
#/etc/init.d/stunnel4 restart
systemctl restart stunnel4

# websocket-python
wget "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/websocket.sh"
chmod +x websocket.sh
screen -S websocket ./websocket.sh
#OpenVPN

wget "https://raw.githubusercontent.com/syapik96/aws/main/install/vpn.sh"
chmod +x vpn.sh
./vpn.sh

# install badvpn
#wget -O /usr/bin/badvpn-udpgw "https://github.com/syapik96/aws/raw/main/badvpn-udpgw64"
#chmod +x /usr/bin/badvpn-udpgw

# install badvpnCDN
cd $HOME
https://github.com/ambrop72/badvpn/archive/refs/tags/1.999.130.zip
unzip 1.999.130.zip
cd 1.999.130
mkdir build
cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
sudo make install
cd
rm 1.999.130.zip

sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo -e "Please un-install the previous version first"
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
cd
apt install -y libxml-parser-perl

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/${GitUser}/aws/main/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

#install bbr dan optimasi kernel
wget "https://raw.githubusercontent.com/syapik96/aws/main/bbr.sh" && chmod +x bbr.sh && ./bbr.sh
wget "https://raw.githubusercontent.com/syapik96/aws/main/set-br.sh" && chmod +x set-br.sh && ./set-br.sh

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

GitUser="syapik96"
# download script
cd /usr/local/sbin
wget -O add-host "https://raw.githubusercontent.com/${GitUser}/aws/main/add-host.sh" && chmod +x add-host
wget -O about "https://raw.githubusercontent.com/${GitUser}/aws/main/about.sh" && chmod +x about
wget -O prince "https://raw.githubusercontent.com/syapik96/aws/main/prince" && chmod +x prince
wget -O menu "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/menu.sh" && chmod +x menu
wget -O sssh "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/ssh.sh" && chmod +x sssh
wget -O system "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/system.sh" && chmod +x system
wget -O usernew "https://raw.githubusercontent.com/${GitUser}/aws/main/usernew.sh" && chmod +x usernew
wget -O trial "https://raw.githubusercontent.com/${GitUser}/aws/main/trial.sh" && chmod +x trial
wget -O hapus "https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/hapus.sh" && chmod +x hapus
wget -O member "https://raw.githubusercontent.com/${GitUser}/aws/main/member.sh" && chmod +x member
wget -o webmin "https://raw.githubusercontent.com/${GitUser}/aws/main/webmin.sh" && chmod +x webmin
wget -O delete "https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/delete.sh" && chmod +x delete
wget -O cek "https://raw.githubusercontent.com/${GitUser}/aws/main/cek.sh" && chmod +x cek
wget -O restart "https://raw.githubusercontent.com/${GitUser}/aws/main/restart1.sh" && chmod +x restart
wget -O speedtest "https://github.com/${GitUser}/aws/raw/main/speedtest_cli.py" && chmod +x speedtest
wget -O info "https://raw.githubusercontent.com/${GitUser}/aws/main/info.sh" && chmod +x info
wget -O ram "https://raw.githubusercontent.com/${GitUser}/aws/main/ram.sh" && chmod +x ram
wget -O renew "https://raw.githubusercontent.com/${GitUser}/aws/main/renew.sh" && chmod +x renew
wget -O autokick "https://raw.githubusercontent.com/${GitUser}/aws/main/autokick.sh" && chmod +x autokick
wget -O ceklim "https://raw.githubusercontent.com/${GitUser}/aws/main/ceklim.sh" && chmod +x ceklim
wget -O tendang "https://raw.githubusercontent.com/${GitUser}/aws/main/tendang.sh" && chmod +x tendang
wget -O clear-log "https://raw.githubusercontent.com/${GitUser}/aws/main/clear-log.sh" && chmod +x clear-log

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab

# remove unnecessary files
apt-get clean
apt-get autoremove
apt -y autoclean
apt -y  --purge remove unscd;
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*;
apt -y autoremove;

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/sslh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500

history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm /root/master.zip
rm -f /root/ssh-vpn.sh
mkdir /root/folderCert
mv /root/cert.pem /root/folderCert/cert.pem
mv /root/key.pem /root/folderCert/key.pem 

# finihsing
prince
netstat -nutlp
