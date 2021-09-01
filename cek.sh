#!/bin/bash
# Script Mod by SL
clear
echo " "
echo " "

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo "-----=[ Dropbear User Login ]=-----";
echo "ID  |  Username  |  IP Address";
echo "-------------------------------------";
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
                fi
done
echo " "
echo "-----=[ OpenSSH User Login ]=-----";
echo "ID  |  Username  |  IP Address";
echo "-------------------------------------";
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
done
if [ -f "/etc/openvpn/openvpn-tcp.log" ]; then
        line=`cat /etc/openvpn/openvpn-tcp.log | wc -l`
        a=$((3+((line-8)/2)))
        b=$(((line-8)/2))
        echo " "
        echo "-----=[ OpenVPN TCP User Login ]=-----";
        echo "Username  |  IP Address  |  Connected Since";
        echo "-------------------------------------";
        cat /etc/openvpn/openvpn-tcp.log | head -n $a | tail -n $b | cut -d "," -f 1,2,5 | sed -e 's/,/   /g' > /tmp/vpn-tcp-db.txt
        cat /tmp/vpn-tcp-db.txt
fi
echo "-------------------------------------"
if [ -f "/etc/openvpn/openvpn-udp.log" ]; then
        line=`cat /etc/openvpn/openvpn-udp.log | wc -l`
        a=$((3+((line-8)/2)))
        b=$(((line-8)/2))
        echo " "
        echo "-----=[ OpenVPN UDP User Login ]=-----";
        echo "Username  |  IP Address  |  Connected Since";
        echo "-------------------------------------";
        cat /etc/openvpn/openvpn-udp.log | head -n $a | tail -n $b | cut -d "," -f 1,2,5 | sed -e 's/,/   /g' > /tmp/vpn-udp-db.txt
        cat /tmp/vpn-udp-db.txt
fi

echo "-------------------------------------"
echo " Multi Login = kill "
echo " Cara pakai : kill [nombor PID] "
echo "-------------------------------------"

echo " Mod By SL"
echo "";
