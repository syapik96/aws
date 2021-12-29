#!/bin/bash
# Script Mod updated by Prince

clear
echo -n > /tmp/other.txt
data=$(cat /etc/v2ray/vless.json | grep '^###' | cut -d ' ' -f 2)
figlet -f slant "Login Status" | lolcat
echo "          --------------------------------" | lolcat;
echo "          -----=[ Vless User Login ]=-----" | lolcat;
echo "          --------------------------------" | lolcat;
echo -e "\e[0m"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
   akun="tidak wujud"
   fi
 done
echo -n > /tmp/ipvless.txt
data2=$(netstat -anp | grep ESTABLISHED | grep tcp6 | grep v2ray | awk '{print $5}' | cut -d: -f1 | sort | uniq)
for ip in "${data2[@]}"
do
jum=$(cat /var/log/v2ray/access2.log | grep -w "$akun" | awk '{print $3}' | cut -d: -f1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
   echo "$jum = $ip" >> /tmp/ipvless.txt
else
   echo "$ip" >> /tmp/other.txt
   fi
jum2=$(cat /tmp/ipvless.txt)
sed -i '/$jum2/d' /tmp/other.txt > /dev/null 2>&1
done
jum3=$(cat /tmp/ipvless.txt)
if [[ -z "$jum3" ]]; then
   echo > /dev/null
else
#akun=$(cat /tmp/ipvless.txt)
ip=$(cat /tmp/other.txt | nl)
echo -e "                       \e[1;32mUser : $akun";
echo -e "               \e[0m"
echo -e "               \e[1;31$ip\e[0m";
echo "          --------------------------------" | lolcat;
echo -e "\e[0m"
fi
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo -e "                       \e[1;31mOther : $oth\e[0m";
echo "";
echo "          --------------------------------" | lolcat;
echo -e "\e[0m"
rm -rf /tmp/other
rm -rf /tmp/ipvless.txt
