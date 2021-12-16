#!/bin/bash
# updated

IP=$(wget -qO- icanhazip.com);
lastport1=$(grep "port_tls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport2=$(grep "port_http" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
if [[ $lastport1 == '' ]]; then
tls=2443
else
tls="$((lastport1+1))"
fi
if [[ $lastport2 == '' ]]; then
http=3443
else
http="$((lastport2+1))"
fi
echo ""
echo -e "Masukkan password"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/shadowsocks-libev/akun.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo -e ""
			echo -e "Akun sudah ada, silahkan masukkan password lain."
			exit 1
		fi
	done
read -p "Expired (hari): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(echo "$exp" | cut -d- -f3)
bln=$(echo "$exp" | cut -d- -f2)

cat > /etc/shadowsocks-libev/$user-tls.json <<-END
{   
    "server":"0.0.0.0",
    "server_port":$tls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"1.1.1.1",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END

cat > /etc/shadowsocks-libev/$user-http.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$http,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"1.1.1.1",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END

chmod +x /etc/shadowsocks-libev/$user-tls.json
chmod +x /etc/shadowsocks-libev/$user-http.json

systemctl start shadowsocks-libev-server@$user-tls.service
systemctl enable shadowsocks-libev-server@$user-tls.service
systemctl start shadowsocks-libev-server@$user-http.service
systemctl enable shadowsocks-libev-server@$user-http.service

echo -e "### $user $exp 
port_tls $tls 
port_http $http" >> /etc/shadowsocks-libev/akun.conf
tmp1=$(echo -n "aes-256-cfb:${user}@${IP}:$tls" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${IP}:$http" | base64 -w0)
linkss1="ss://${tmp1}?plugin=obfs-local;obfs=tls;obfs-host=your.bug.com"
linkss2="ss://${tmp2}?plugin=obfs-local;obfs=http;obfs-host=your.bug.com"
clear

echo -e ""
echo -e "=======-Shadowsocks-======="
echo -e "IP/Host        : $IP"
echo -e "Host           : $domain"
echo -e "Port OBFS TLS  : $tls"
echo -e "Port OBFS HTTP : $http"
echo -e "Password       : $user"
echo -e "Method         : aes-256-cfb"
echo -e "Aktif Sampai   : $exp"
echo -e "==========================="
echo -e "Link OBFS TLS : $linkss1"
echo -e "==========================="
echo -e "Link OBFS HTTP : $linkss2"
echo -e "==========================="
echo -e "Script Mod by Prince"
