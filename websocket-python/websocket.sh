#!/bin/bash
# Proxy For Connection Over WebSocket-Python
# ====================================


echo -e ""
echo -e "\e[1;32mInstalling WebSocket-Python Start in 5 sec\e[0m"
echo -e ""
sleep 5 
clear
cd
# Install Script SSH WebSocket-Python
cd /usr/local/bin/
wget -q -O /usr/local/bin/ws-openssh "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-openssh"
chmod +x /usr/local/bin/ws-openssh
wget -q -O /usr/local/bin/ws-dropbear "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-dropbear"
chmod +x /usr/local/bin/ws-dropbear
wge -q -O /usr/local/bin/ws-stunnel "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-stunnel"
chmod +x /usr/local/bin/ws-stunnel
wget -q -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-ovpn"
chmod +x /usr/local/bin/ws-ovpn

# Install system auto run
cd /etc/systemd/system
# System OpenSSH Over WebSocket-Python
wget -q -O /etc/systemd/system/ws-openssh.service "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-openssh.service"
chmod +x /etc/systemd/system/ws-openssh.service
# Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service

# System Dropbear Over WebSocket-Python
wget -q -O /etc/systemd/system/ws-dropbear.service "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-dropbear.service"
chmod +x /etc/systemd/system/ws-dropbear.service
# Enable & Start & 
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service

#System SSL/TLS Over WebSocket-Python
wget -q -O /etc/systemd/system/ws-stunnel.service "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-stunnel.service"
chmod +x /etc/systemd/system/ws-stunnel.service
#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service

#System Openvpn-CDN Over Websocket-Python
wget -q -O /etc/systemd/system/ws-ovpn.service "https://raw.githubusercontent.com/vaws/main/websocket-python/ws-ovpn.service"
chmod +x /etc/systemd/system/ws-ovpn.service
#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service

## Restart service
systemctl daemon-reload
systemctl restart ws-openssh.service
systemctl restart ws-dropbear.service
systemctl restart ws-stunnel.service
systemctl restart ws-ovpn.service
