#!/bin/bash
#
# Mod by t.me/PrinceNewbie 
#     COPYRIGHT.2022
# ==================================================

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ANU=$(ip -o $ANU -4 route show to default | awk '{print $5}');
MySentev="$(cat /etc/v2ray/domain)";


# Install OpenVPN dan Easy-RSA
apt-get install -y openvpn dnsutils easy-rsa unzip 
apt install -y openvpn dnsutils easy-rsa unzip 
apt-get install -y  openssl iptables iptables-persistent 
apt install -y  openssl iptables iptables-persistent 

#mkdir -p /etc/openvpn/easy-rsa
cd /etc/openvpn
wget https://raw.githubusercontent.com/syapik96/aws/main/install/vpn.zip
unzip /etc/openvpn/vpn.zip
rm -f /etc/openvpn/vpn.zip 
chown -R root:root /etc/openvpn/server
# server config
cp /etc/openvpn/server/ca.crt /etc/openvpn/ca.crt
cp /etc/openvpn/server/easy-rsa/server/dh2048.pem /etc/openvpn/dh2048.pem
cp /etc/openvpn/server/server.crt /etc/openvpn/server.crt
cp /etc/openvpn/server/server.key /etc/openvpn/server.key
chmod +x /etc/openvpn/ca.crt
# move server config setup n tcp-udp conf
#mv /etc/openvpn/server/server-tcp-1194.conf /etc/openvpn/
#mv /etc/openvpn/server/server-udp-2200.conf /etc/openvpn/
#mv /etc/openvpn/server/server/ipp.txt /etc/openvpn/
#mv /etc/openvpn/server/server/openvpn-status.log /etc/openvpn/

cd
mkdir -p /usr/lib/openvpn/
cp /usr/lib/x86_64-linux-gnu/openvpn/plugins/openvpn-plugin-auth-pam.so /usr/lib/openvpn/openvpn-plugin-auth-pam.so

# nano /etc/default/openvpn
sed -i 's/#AUTOSTART="all"/AUTOSTART="all"/g' /etc/default/openvpn

# aktifkan ip4 forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf

# Remove default Create New
cd
rm /etc/openvpn/*.conf

# Buat config server TCP 1194
cd /etc/openvpn
cat > /etc/openvpn/server-tcp-1194.conf <<-EOF
port 1194
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 1.0.0.1"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status /var/log/openvpn/server-tcp-1194.log
verb 3
EOF

# Buat config server UDP 2200
cat > /etc/openvpn/server-udp-2200.conf <<-EOF3
port 2200
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 1.0.0.1"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status /var/log/openvpn/server-udp-2200.log
verb 3
EOF3

# restart openvpn dan cek status openvpn
systemctl enable --now openvpn-server@server-tcp-1194
systemctl enable --now openvpn-server@server-udp-2200
/etc/init.d/openvpn restart
/etc/init.d/openvpn status

# Buat config client TCP 1194
cat > /etc/openvpn/client-tcp-1194.ovpn <<-END
# OVPN CLIENT-TCP CONFIG
# ----------------------------
setenv FRIENDLY_NAME $MySentev
setenv CLIENT_CERT 0
client
dev tun
proto tcp
remote xxxxxxxxx 1194
# back-quary or back inject method
# remote "IP:PORT@bughost.yourdomain.com/
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3

## [1] ##
# http-proxy-option CUSTOM-HEADER Protocol HTTP/1.1
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
## [2] ##
# "http-proxy-option CUSTOM-HEADER HTTP/1.1" or "http-proxy-option VERSION 1.1"
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forward-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forwarded-For bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Referrer bughost.yourdomain.com
## 3 ##
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forwarded-For bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Referrer bughost.yourdomain.com
#
## [3] [NEW proxy-option] ##
# http-proxy-option CUSTOM-HEADER CONNECT HTTP/1.1
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Online-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER ""
# http-proxy-option CUSTOM-HEADER "PUT http://bughost.yourdomain.com/ HTTP/1.1"
# http-proxy-option CUSTOM-HEADER X-Forward-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Connection:Keep-Alive

END

sed -i $MYIP2 /etc/openvpn/client-tcp-1194.ovpn;

# Buat config client UDP 2200
cat > /etc/openvpn/client-udp-2200.ovpn <<-END2
# OVPN CLIENT-TCP CONFIG
# ----------------------------
setenv FRIENDLY_NAME $MySentev
setenv CLIENT_CERT 0
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

END2

sed -i $MYIP2 /etc/openvpn/client-udp-2200.ovpn;

# Buat config client SSL
cat > /etc/openvpn/client-tcp-ssl.ovpn <<-END3
# OVPN CLIENT-TCP-SSL CONFIG
# ----------------------------
setenv FRIENDLY_NAME $MySentev
setenv CLIENT_CERT 0
client
dev tun
proto tcp
remote xxxxxxxxx 992
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3

## [1] ##
# http-proxy-option CUSTOM-HEADER Protocol HTTP/1.1
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
## [2] ##
# "http-proxy-option CUSTOM-HEADER HTTP/1.1" or "http-proxy-option VERSION 1.1"
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forward-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forwarded-For bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Referrer bughost.yourdomain.com
## 3 ##
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Forwarded-For bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Referrer bughost.yourdomain.com
#
## [3] [NEW proxy-option] ##
# http-proxy-option CUSTOM-HEADER CONNECT HTTP/1.1
# http-proxy-option CUSTOM-HEADER Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER X-Online-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER ""
# http-proxy-option CUSTOM-HEADER "PUT http://bughost.yourdomain.com/ HTTP/1.1"
# http-proxy-option CUSTOM-HEADER X-Forward-Host bughost.yourdomain.com
# http-proxy-option CUSTOM-HEADER Connection:Keep-Alive

END3

sed -i $MYIP2 /etc/openvpn/client-tcp-ssl.ovpn;

cd
# pada tulisan xxx ganti dengan alamat ip address VPS anda 
/etc/init.d/openvpn restart

# Enter the certificate into the TCP 1194 client .
echo '<ca>' >> /etc/openvpn/client-tcp-1194.ovpn
cat '/etc/openvpn/server/ca.crt' >> /etc/openvpn/client-tcp-1194.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-1194.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( TCP 1194 )
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/client-tcp-1194.ovpn

# 2200
# Enter the certificate into the UDP 2200 client config
cho '<ca>' >> /etc/openvpn/client-udp-2200.ovpn
cat '/etc/openvpn/ca.crt' >> /etc/openvpn/client-udp-2200.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-2200.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( UDP 2200 )
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/client-udp-2200.ovpn

# Enter the certificate into the config SSL client .
echo '<ca>' >> /etc/openvpn/client-tcp-ssl.ovpn
cat '/etc/openvpn/server/ca.crt' >> /etc/openvpn/client-tcp-ssl.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ssl.ovpn

# Copy config OpenVPN client ke home directory root agar mudah didownload ( SSL )
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/client-tcp-ssl.ovpn

# allow ufw 
apt-get install ufw
ufw allow ssh
ufw allow 1194/tcp
ufw allow 81/tcp
ufw allow 2200/udp


#firewall untuk memperbolehkan akses UDP dan akses jalur TCP
iptables -t nat -I POSTROUTING -s 10.6.0.0/24 -o $ANU -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.7.0.0/24 -o $ANU -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules

iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# Restart service openvpn
systemctl enable openvpn
systemctl start openvpn
/etc/init.d/openvpn restart

# Delete script
history -c
sleep 1
rm -f /root/vpn.sh
