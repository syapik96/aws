#!/bin/bash
#shadowsocks-libev obfs


#
GitUser="syapik96"
# wget https://github.com/${GitUser}/
# Install_Packages
echo "#############################################"
echo "      Install Packages..."
apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake -y
echo "     Installing Packages has Finished."
echo "#############################################"


# Install_Shadowsocks_libev
echo "#############################################"
echo "          Install Shadowsocks-libev..."
echo "#############################################"
apt-get install software-properties-common -y
source /etc/os-release
OS=$ID
ver=$VERSION_ID
if [[ $OS == 'ubuntu' ]]; then
     apt-get install shadowsocks-libev -y
     apt-get  install simple-obfs -y
elif [[ $OS == 'debian' ]]; then
     if [[ "$ver" = "9" ]]; then
        echo "deb http://deb.debian.org/debian stretch-backports main" | tee /etc/apt/sources.list.d/stretch-backports.list
        apt-get update
        apt -t stretch-backports install shadowsocks-libev -y
        apt -t stretch-backports install simple-obfs -y
   elif [[ "$ver" = "10" ]]; then
        echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/buster-backports.list
        apt-get update
        apt -t buster-backports install shadowsocks-libev -y
        apt -t buster-backports install simple-obfs -y
       fi
      fi
echo -e "\e[1;32mInstall Shadowsocks-libev Finish.\e[0m"
echo -e "#############################################" | lolcat 
sleep 2

# Server Configuration setting
echo "#############################################"
echo "Configuration SS Server."
cat > /etc/shadowsocks-libev/config.json <<EOF
{   
    "server":"0.0.0.0",
    "server_port":8488,
    "password":"test",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "nameserver":"1.1.1.1",
    "mode":"tcp_and_udp",
}

EOF
echo -e "\e[1;31Configuration has been Success\e[0m"
echo -e "#############################################" | lolcat

#mulai ~shadowsocks-libev~ server
echo "#############################################"
echo -e "\e[1;31System Now Enable & Start the Shadowsock service" 
systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service
echo "#############################################"

#Create client config
echo "#############################################"
echo "          Creating config obfs"
cat > /etc/shadowsocks-libev.json <<EOF
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "mode":"tcp_and_udp",
    "fast_open":true,
    "plugin":"/usr/bin/obfs-local",
    "plugin_opts":"obfs=tls;failover=127.0.0.1:1443;fast-open"
}
EOF
chmod +x /etc/shadowsocks-libev.json
echo "#############################################"

touch /etc/shadowsocks-libev/akun.conf

echo "#############################################"
echo "   Enable UDP & TCP Port Shadowsocks-libev"
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2443:3543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2443:3543 -j ACCEPT
ip6tables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2443:3543 -j ACCEPT
ip6tables -I INPUT -m state --state NEW -m udp -p udp --dport 2443:3543 -j ACCEPT
iptables-save > /etc/iptables.up.rules
ip6tables-save > /etc/ip6tables.up.rules

GitUser="syapik96"
cd /usr/local/sbin
wget -O ssssr "https://raw.githubusercontent.com/${GitUser}/aws/main/menu-update/ssssr.sh" && chmod +x ssssr
wget -O addss "https://raw.githubusercontent.com/${GitUser}/aws/main/tambah/addss.sh"
wget -O delss "https://raw.githubusercontent.com/${GitUser}/aws/main/hapus/delss.sh"
wget -O cekss "https://raw.githubusercontent.com/${GitUser}/aws/main/cekss.sh"
wget -O xp-ss "https://raw.githubusercontent.com/${GitUser}/aws/main/xp-ss.sh"
wget -O renewss "https://raw.githubusercontent.com/${GitUser}/aws/main/renewss.sh"
chmod +x addss
chmod +x delss
chmod +x cekss
chmod +x xp-ss
chmod +x renewss
cd
rm -f /root/shadowsocksobfs.sh
echo "0 0 * * * root xp-ss" >> /etc/crontab
