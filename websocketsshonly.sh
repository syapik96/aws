#!/bin/bash
# UPDATED 22-1-22

cd 
# Installing Service ws edu-ovpn
wget -q -O /usr/local/bin/edu-ovpn "https://raw.githubusercontent.com/syapik96/aws/main/lain2/ovpn.py"
chmod +x /usr/local/bin/edu-ovpn

# Create system Service ws edu-ovpn
cat > /etc/systemd/system/edu-ovpn.service <<END
[Unit]
Description=Edu-Ovpn Python Over Websocket 
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ovpn 2099
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service ws-dropbear
wget -q -O /usr/local/bin/ws-dropbear "https://raw.githubusercontent.com/syapik96/aws/main/lain2/dropbear-ws.py"
chmod +x /usr/local/bin/ws-dropbear

# Create system Service ws-dropbear
cat > /etc/systemd/system/ws-dropbear.service <<END
[Unit]
Description=Dropbear Python Over Websocket
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-dropbear
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service ws-stunnel
wget -O /usr/local/bin/ws-stunnel "https://raw.githubusercontent.com/syapik96/aws/main/lain2/ws-stunnel.py"
chmod +x /usr/local/bin/ws-stunnel

# Create system Service ws-stunnel
cat > /etc/systemd/system/ws-stunnel.service <<END
[Unit]
Description=Python Ssl Proxy Websocket
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service edu-openssh
wget -O /usr/local/bin/edu-openssh "https://raw.githubusercontent.com/syapik96/aws/main/lain2/edu-openssh.py"
chmod +x /usr/local/bin/edu-openssh

# Create system Service edu-openssh
cat > /etc/systemd/system/edu-openssh.service <<END
[Unit]
Description=Python Openssh Proxy Websocket
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-openssh 100
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# ENABLE & START/RESTART SERVICE
systemctl daemon-reload
systemctl enable edu-ovpn
systemctl restart edu-ovpn
systemctl enable ws-dropbear
systemctl restart ws-dropbear
systemctl enable ws-stunnel
systemctl restart ws-stunnel
systemctl enable edu-openssh
systemctl restart edu-openssh
