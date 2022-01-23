#!/bin/bash
# Script updated by prince
# Copyright © 2022

clear
echo -e " ------------------------------" | lolcat;
echo -e "---=[ SS - OBFS User Login ]=---" | lolcat;
echo -e " ------------------------------" | lolcat;
echo -e ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo -e "-------------------------------" | lolcat;
echo -e "          User  |  TLS" | lolcat
echo -e "-------------------------------"; | lolcat;
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(lsof -n | grep -i ESTABLISHED | grep obfs-serv | awk '{print $9}' | cut -d':' -f2 | grep -w $port | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2 | nl)
echo " $akun - $port"
echo "$jum"; x=$(( "$x" + 1 ))
echo -e "-------------------------------" | lolcat;
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo -e ""
echo -e "-------------------------------" | lolcat;
echo -e "         User  |  HTTP" | lolcat
echo -e "-------------------------------" | lolcat;
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(lsof -n | grep -i ESTABLISHED | grep obfs-serv | awk '{print $9}' | cut -d':' -f2 | grep -w $port | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2)
echo " $akun - $port"
echo "$jum"; x=$(( "$x" + 1 ))
echo -e "-------------------------------" | lolcat
done
echo -e "\e[1;32mPowered By Prince`aka`syapik96\e[0m"


