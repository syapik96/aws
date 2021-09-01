#!/bin/bash
clear
echo "-------------------------------";
echo "---=[ SS - OBFS User Login ]=---";
echo "-------------------------------";
echo ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo "-------------------------------";
echo " User | TLS"
echo "-------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(lsof -n | grep -i ESTABLISHED | grep obfs-serv | awk '{print $9}' | cut -d':' -f2 | grep -w $port | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2 | nl)
echo " $akun - $port"
echo "$jum"; x=$(( "$x" + 1 ))
echo "-------------------------------"
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo ""
echo "-------------------------------";
echo " User |  HTTP"
echo "-------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(lsof -n | grep -i ESTABLISHED | grep obfs-serv | awk '{print $9}' | cut -d':' -f2 | grep -w $port | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2)
echo " $akun - $port"
echo "$jum"; x=$(( "$x" + 1 ))
echo "-------------------------------"
done
echo -e "Mod by SL"


