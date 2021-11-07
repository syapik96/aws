#!/bin/bash
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ###
# Mod by PrinceNewbie
# ==================================================

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ANU=$(ip -o $ANU -4 route show to default | awk '{print $5}');

# Install OpenVPN dan Easy-RSA
apt install -y openvpn easy-rsa openssl apache2 ufw
apt install -y iptables iptables-persistent  

cd /etc/stunnel/
openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -sha256 -subj '/CN=127.0.0.1/O=localhost/C=US' -keyout /etc/stunnel/stunnel.pem -out /etc/stunnel/stunnel.pem
sudo touch stunnel.conf
echo "client = no" > /etc/stunnel/stunnel.conf
echo "pid = /var/run/stunnel.pid" >> /etc/stunnel/stunnel.conf
echo "[openvpn2]" >> /etc/stunnel/stunnel.conf
echo "accept = 443" >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:1194" >> /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem" >> /etc/stunnel/stunnel.conf
sudo sed -i -e 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo cp /etc/stunnel/stunnel.pem ~
echo "client = yes\ndebug = 6\n[openvpn]\naccept = 127.0.0.1:1194\nconnect = $IPADDRESS:443\nTIMEOUTclose = 0\nverify = 0\nsni = $1" > /var/www/html/stunnel.conf
# openvpn

mv /etc/openvpn/easy-rsa/vars.example /etc/openvpn/easy-rsa/vars
cp -r /usr/share/easy-rsa/ /etc/openvpn
mkdir /etc/openvpn/easy-rsa/keys
sed -i 's|export KEY_COUNTRY="US"|export KEY_COUNTRY="MY"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_PROVINCE="CA"|export KEY_PROVINCE="Malaysia"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_CITY="SanFrancisco"|export KEY_CITY="Wilayah Persekutuan Kuala Lumpur"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_ORG="Fort-Funston"|export KEY_ORG=OnePieceVPN Inc"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_EMAIL="me@myhost.mydomain"|export KEY_EMAIL="prince@onepiecevpn.ml"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU="MyOrganizationalUnit"|export KEY_OU="OnePieceVPN Inc"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_NAME="EasyRSA"|export KEY_NAME="Prince D Newbie"|' /etc/openvpn/easy-rsa/vars
sed -i 's|export KEY_OU=changeme|export KEY_OU=OnePieceVPN Inc|' /etc/openvpn/easy-rsa/vars

# just double checking if anything should u want 
nano /etc/openvpn/easy-rsa/vars

# generate Diffie hellman parameters
openssl dhparam -out /etc/openvpn/dh2048.pem 2048

# Create PKI
cd /etc/openvpn/easy-rsa
. ./vars
./clean-all
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --initca $*

# Create key server
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --server server

# Setting KEY CN
export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" client

# cp /etc/openvpn/easy-rsa/keys/{server.crt,server.key,ca.crt} /etc/openvpn
cd
cp /etc/openvpn/easy-rsa/keys/server.crt /etc/openvpn/server.crt
cp /etc/openvpn/easy-rsa/keys/server.key /etc/openvpn/server.key
cp /etc/openvpn/easy-rsa/keys/ca.crt /etc/openvpn/ca.crt
chmod +x /etc/openvpn/ca.crt

# install openvpn
# wget -O /etc/openvpn/vpn.zip "https://github.com//raw/main/vpn.zip"
# cd /etc/openvpn/
# unzip vpn.zip
# rm -f vpn.zip
cd
# Buat config server TCP 1194

cd /etc/openvpn
cat > /etc/openvpn/server-tcp-1194.conf <<-END
port 1194
proto tcp
dev tun
ca /etc/openvpn/ca.crt
cert /etc/openvpn/server.crt
key /etc/openvpn/server.key
dh /etc/openvpn/dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status server-tcp-1194.log
verb 3
END

# Buat config server TCP 1197

cd /etc/openvpn
cat > /etc/openvpn/server-tcp-1197.conf <<-END
port 1197
proto tcp
dev tun
ca /etc/openvpn/ca.crt
cert /etc/openvpn/server.crt
key /etc/openvpn/server.key
dh /etc/openvpn/dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
push "route-method exe"
push "route-delay 2"
keepalive 10 120
comp-lzo
user nobody
group nogroup
persist-key
persist-tun
status server-tcp-1197.log
verb 3

END

# Buat config server UDP 2200
cat > /etc/openvpn/server-udp-2200.conf <<-END
port 2200
proto udp
dev tun
ca /etc/openvpn/ca.crt
cert /etc/openvpn/server.crt
key /etc/openvpn/server.key
dh /etc/openvpn/dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
push "route-method exe"
push "route-delay 2"
keepalive 10 120
comp-lzo
user nobody
group nogroup
persist-key
persist-tun
status server-udp-2200.log
verb 3
END

cd
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so

# nano /etc/default/openvpn
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn
# Cari pada baris #AUTOSTART=”all” hilangkan tanda pagar # didepannya sehingga menjadi AUTOSTART=”all”. Save dan keluar dari editor

# restart openvpn dan cek status openvpn
/etc/init.d/openvpn restart
/etc/init.d/openvpn status

# aktifkan ip4 forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
# edit file sysctl.conf
# nano /etc/sysctl.conf
# Uncomment hilangkan tanda pagar pada #net.ipv4.ip_forward=1

# Konfigurasi dan Setting untuk Client
mkdir clientconfig
cp /etc/openvpn/{server.crt,server.key,ca.crt,ta.key} clientconfig/
cd clientconfig


# Buat config client TCP 1197
cd /etc/openvpn
cat > /etc/openvpn/client-tcp-1197.ovpn <<-END
############## WELCOME TO OnePieceVPN###############
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ######
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto tcp
setenv FRIENDLY_NAME "OnePieceVPN Inc"
remote xxxxxxxxx 1197
remote-cert-tls server
connect-retry infinite
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
auth none
auth-nocache
cipher none
comp-lzo
redirect-gateway def1
setenv CLIENT_CERT 0
reneg-sec 0
verb 3
http-proxy $MYIP 8080
http-proxy-option VERSION 1.1
http-proxy-option AGENT Chrome/80.0.3987.87
http-proxy-option CUSTOM-HEADER Host bug.com
http-proxy-option CUSTOM-HEADER X-Forward-Host bug.com
http-proxy-option CUSTOM-HEADER X-Forwarded-For bug.com
http-proxy-option CUSTOM-HEADER Referrer bug.com
dhcp-option DNS 8.8.8.8
dhcp-option DNS 8.8.4.4

END

sed -i $MYIP2 /etc/openvpn/client-tcp-1194.ovpn;

# Buat config client UDP 1194
cd /etc/openvpn
cat > /etc/openvpn/client-udp-1194.ovpn <<-END
############## WELCOME TO ###############
########## syapik96 ###########
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto udp
remote xxxxxxxxx 1194
rremote-cert-tls server
connect-retry infinite
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
auth none
auth-nocache
cipher none
comp-lzo
redirect-gateway def1
setenv CLIENT_CERT 0
reneg-sec 0
verb 3
http-proxy $MYIP 8080
http-proxy-option VERSION 1.1
http-proxy-option AGENT Chrome/80.0.3987.87
http-proxy-option CUSTOM-HEADER Host bug.com
http-proxy-option CUSTOM-HEADER X-Forward-Host bug.com
http-proxy-option CUSTOM-HEADER X-Forwarded-For bug.com
http-proxy-option CUSTOM-HEADER Referrer bug.com

END

sed -i $MYIP2 /etc/openvpn/client-udp-1194.ovpn;

# Buat config client TCP 1194
cat > /etc/openvpn/client-tcp-1194.ovpn <<-END
############## WELCOME TO OnePieceVPN ###############
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ######
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto tcp
remote xxxxxxxxx 1194
rremote-cert-tls server
connect-retry infinite
resolv-retry infinite
nobind
persist-key
persist-tun
auth-user-pass
auth none
auth-nocache
cipher none
comp-lzo
redirect-gateway def1
setenv CLIENT_CERT 0
reneg-sec 0
verb 3
http-proxy $MYIP 8080
http-proxy-option VERSION 1.1
http-proxy-option AGENT Chrome/80.0.3987.87
http-proxy-option CUSTOM-HEADER Host bug.com
http-proxy-option CUSTOM-HEADER X-Forward-Host bug.com
http-proxy-option CUSTOM-HEADER X-Forwarded-For bug.com
http-proxy-option CUSTOM-HEADER Referrer bug.com

END

sed -i $MYIP2 /etc/openvpn/client-tcp-1194.ovpn;

# Buat config client UDP 2200
cat > /etc/openvpn/client-udp-2200.ovpn <<-END
############## WELCOME TO OnePieceVPN ###############
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ######
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto udp
remote xxxxxxxxx 2200
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-udp-2200.ovpn;

# Buat config client TCP 2200
cat > /etc/openvpn/client-tcp-2200.ovpn <<-END
############## WELCOME TO OnePieceVPN ###############
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ######
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto tcp
remote xxxxxxxxx 2200
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-tcp-2200.ovpn;

# Buat config client SSL
cat > /etc/openvpn/client-tcp-ssl.ovpn <<-END
############## WELCOME TO OnePieceVPN ###############
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ######
####### DONT FORGET TO SUPPORT US #######
client
dev tun
proto tcp
remote xxxxxxxxx 442
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END

sed -i $MYIP2 /etc/openvpn/client-tcp-ssl.ovpn;

cd
# pada tulisan xxx ganti dengan alamat ip address VPS anda 
/etc/init.d/openvpn restart

#1197
# masukkan certificatenya ke dalam config client TCP 1197
echo '<ca>' >> /etc/openvpn/client-tcp-1197.ovpn
cat /etc/openvpn/ca.crt >> /etc/openvpn/client-tcp-1197.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-1197.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 1197 )
cp /etc/openvpn/client-tcp-1197.ovpn /home/vps/public_html/client-tcp-1197.ovpn

#1194
# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/client-tcp-1194.ovpn
cat /etc/openvpn/ca.crt >> /etc/openvpn/client-tcp-1194.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-1194.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 1194 )
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/client-tcp-1194.ovpn

#2200
# masukkan certificatenya ke dalam config client UDP 2200
echo '<ca>' >> /etc/openvpn/client-udp-2200.ovpn
cat /etc/openvpn/ca.crt >> /etc/openvpn/client-udp-2200.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-2200.ovpn
# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 2200 )
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/client-udp-2200.ovpn

# masukkan certificatenya ke dalam config client SSL
echo '<ca>' >> /etc/openvpn/client-tcp-ssl.ovpn
cat /etc/openvpn/ca.crt >> /etc/openvpn/client-tcp-ssl.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ssl.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( SSL )
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/client-tcp-ssl.ovpn

#firewall untuk memperbolehkan akses UDP dan akses jalur TCP

iptables -t nat -I POSTROUTING -s 10.6.0.0/24 -o $ANU -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o $ANU -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules

iptables-restore -t < /etc/iptables.up.rules
# enable port for client connect server via config
iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 1194 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 1197 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 2200 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m udp -p udp --dport 1194 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m udp -p udp --dport 1197 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m udp -p udp --dport 8080 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -m udp -p udp --dport 2200 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# add dns server ipv4
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
sed -i '$ i\echo "nameserver 8.8.8.8" > /etc/resolv.conf' /etc/rc.local
sed -i '$ i\echo "nameserver 8.8.4.4" >> /etc/resolv.conf' /etc/rc.local
# Restart service openvpn
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart

# Restore iptables
cat > /etc/network/if-up.d/iptables <<-END
iptables-restore < /etc/iptables.up.rules
iptables -t nat -A POSTROUTING -s 10.6.0.0/24 -o $ANU -j SNAT --to xxxxxxxxx
iptables -t nat -A POSTROUTING -s 10.7.0.0/24 -o $ANU -j SNAT --to xxxxxxxxx

END
sed -i $MYIP2 /etc/network/if-up.d/iptables
chmod +x /etc/network/if-up.d/iptables

# restart opevpn
/etc/init.d/openvpn restart

# Delete script
history -c
rm -f /root/vpn.sh
