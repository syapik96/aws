#!/bin/bash
MYIP=$(wget -qO- ifconfig.co);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
OS=$ID
ver=$VERSION_ID
if [[ $OS == 'ubuntu' ]]; then
if [[ "$ver" = "18.04" ]]; then
yoi=Ubuntu18
elif [[ "$ver" = "20.04" ]]; then
yoi=Ubuntu20
fi
elif [[ $OS == 'debian' ]]; then
if [[ "$ver" = "9" ]]; then
yoi=Debian9
elif [[ "$ver" = "10" ]]; then
yoi=Debian10
fi
fi
mkdir /home/sstp
touch /home/sstp/sstp_account
touch /var/lib/premium-script/data-user-sstp
#detail nama perusahaan
country=MY
state=Malaysia
locality=Malaysia
organization=gilergames
organizationalunit=gilergames
commonname=gilergames.tk
email=zulhisyam421@gmail.com

#install sstp
apt install openssl iptables iptables-persistent -y
apt-get install -y build-essential cmake gcc linux-headers-`uname -r` git libpcre3-dev libssl-dev liblua5.1-0-dev ppp
git clone https://github.com/accel-ppp/accel-ppp.git /opt/accel-ppp-code
mkdir /opt/accel-ppp-code/build
cd /opt/accel-ppp-code/build/
cmake -DBUILD_IPOE_DRIVER=TRUE -DBUILD_VLAN_MON_DRIVER=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DKDIR=/usr/src/linux-headers-`uname -r` -DLUA=TRUE -DCPACK_TYPE=$yoi ..
make
cpack -G DEB
dpkg -i accel-ppp.deb
mv /etc/accel-ppp.conf.dist /etc/accel-ppp.conf
#
GitUser="syapik96"
#wget https://github.com/${GitUser}/
#
wget -O /etc/accel-ppp.conf "https://raw.githubusercontent.com/${GitUser}/aws/main/accel.conf"
sed -i $MYIP2 /etc/accel-ppp.conf
chmod +x /etc/accel-ppp.conf
systemctl start accel-ppp
systemctl enable accel-ppp
#gen cert sstp
cd /home/sstp
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl genrsa -out server.key 4096
openssl req -new -key server.key -out ia.csr \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl x509 -req -days 3650 -in ia.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
cp /home/sstp/server.crt /home/vps/public_html/server.crt
iptables -t nat -A POSTROUTING -o $NIC -j MASQUERADE
iptables-save > /etc/iptables.up.rules
chmod +x /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

#input perintah sstp
GitUser="syapik96"
#wget https://github.com/${GitUser}/
wget -O /usr/bin/addsstp https://raw.githubusercontent.com/${GitUser}/aws/main/tambah/addsstp.sh && chmod +x /usr/bin/addsstp
wget -O /usr/bin/delsstp https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/delsstp.sh && chmod +x /usr/bin/delsstp
wget -O /usr/bin/ceksstp https://raw.githubusercontent.com/${GitUser}/aws/main/ceksstp.sh && chmod +x /usr/bin/ceksstp
wget -O /usr/bin/xp-sstp https://raw.githubusercontent.com/${GitUser}/aws/main/xp-sstp.sh && chmod +x /usr/bin/xp-sstp
wget -O /usr/bin/renewsstp https://raw.githubusercontent.com/${GitUser}/aws/main/renewsstp.sh && chmod +x /usr/bin/renewsstp
rm -f /root/sstp.sh
echo "0 0 * * * root xp-sstp" >> /etc/crontab
