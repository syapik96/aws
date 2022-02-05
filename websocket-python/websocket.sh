#!/bin/bash
# Proxy For Connection Over WebSocket-Python
# ====================================
# UPDATED 22-1-28

cd 
# Installing Service ws ws-ovpn
wget -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/syapik96/aws/main/lain2/ovpn.py"
chmod +x /usr/local/bin/ws-ovpn

# Create system Service ws ws-ovpn
cat > /etc/systemd/system/ws-ovpn.service <<END
[Unit]
Description=OpenVpn Over Websocket Python
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2099
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Installing Service ws-dropbear
wget -O /usr/local/bin/ws-dropbear "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/dropbear-ws.py"
chmod +x /usr/local/bin/ws-dropbear

# Create system Service ws-dropbear
cat > /etc/systemd/system/ws-dropbear.service <<END
[Unit]
Description=Dropbear Over Websocket Python
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
wget -O /usr/local/bin/ws-stunnel "https://raw.githubusercontent.com/syapik96/aws/main/websocket-python/ws-stunnel.py"
chmod +x /usr/local/bin/ws-stunnel

# Create system Service ws-stunnel
cat > /etc/systemd/system/ws-stunnel.service <<END
[Unit]
Description=Ssl/tls Proxy Over Websocket Python
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

# Installing Service ws-openssh
wget -O /usr/local/bin/ws-openssh "https://raw.githubusercontent.com/syapik96/aws/main/lain2/edu-openssh.py"
chmod +x /usr/local/bin/ws-openssh

# Create system Service ws-openssh
cat > /etc/systemd/system/ws-openssh.service <<END
[Unit]
Description=OpenSSH Over Websocket Python
Documentation=https://github.com/syapik96/aws
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-openssh
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# ENABLE & START/RESTART SERVICE
systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn
systemctl enable ws-dropbear
systemctl restart ws-dropbear
systemctl enable ws-stunnel
systemctl restart ws-stunnel
systemctl enable ws-openssh
systemctl restart ws-openssh
