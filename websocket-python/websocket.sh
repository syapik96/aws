#!/bin/bash
clear
echo -e "\e[1;32mInstalling Websocket-SSH Python\e[0m"
sleep 1
echo Cek Hak Akses...
sleep 0.5

#Buat name user github dan nama folder
GitUser="syapik96"
#wget https://github.com/${GitUser}/
#Install system auto run
cd /etc/systemd/system
#System OpenSSH Websocket-SSH Python
wget -O ws-openssh.service "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-openssh.service"
chmod +x ws-openssh.service

#System Dropbear Websocket-SSH Python
wget -O ws-dropbear.service "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-dropbear.service"
chmod +x ws-dropbear.service 

#System SSL/TLS Websocket-SSH Python
wget -O ws-stunnel.service "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-stunnel.service"
chmod +x ws-stunnel.service

#System Websocket-OpenVPN Python
wget -O ws-ovpn.service "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-ovpn.service"
chmod +x ws-ovpn.service

#Install Script Websocket-SSH Python
cd /usr/local/bin
wget -O ws-openssh "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-openssh.py" 
wget -O ws-dropbear "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-dropbear.py" 
wget -O ws-stunnel "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-stunnel.py" 
wget -O ws-ovpn "https://raw.githubusercontent.com/${GitUser}/aws/main/websocket-python/ws-ovpn.py" 
chmod +x ws-openssh
chmod +x ws-dropbear
chmod +x ws-stunnel
chmod +x ws-ovpn
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
