#!/bin/bash
#

# Edu OVPN
wget -q -O /usr/local/bin/edu-ovpn "https://raw.githubusercontent.com/syapik96/aws/main/lain2/ovpn.py"
chmod +x /usr/local/bin/edu-ovpn

# Installing Service
cat > /etc/systemd/system/edu-ovpn.service <<END
[Unit]
Description=Edu-Ovpn Python Over Websocket 
Documentation=https://gilergames.tk
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ovpn
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-ovpn
systemctl restart edu-ovpn

# ws-dropbear
wget -q -O /usr/local/bin/ws-dropbear "https://raw.githubusercontent.com/syapik96/aws/main/lain2/dropbear-ws.py"
chmod +x /usr/local/bin/ws-dropbear

# Installing Service
cat > /etc/systemd/system/ws-dropbear.service <<END
[Unit]
Description=Dropbear Python Over Websocket
Documentation=https://gilergames.tk
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

systemctl daemon-reload
systemctl enable ws-dropbear
systemctl restart ws-dropbear

#edusshssl
wget -O /usr/local/bin/ws-stunnel "https://raw.githubusercontent.com/syapik96/aws/main/lain2/ws-stunnel.py"
chmod +x /usr/local/bin/ws-stunnel

# Installing Service
cat > /etc/systemd/system/ws-stunnel.service <<END
[Unit]
Description=Python Ssl Proxy Websocket
Documentation=https://gilergames.tk
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

systemctl daemon-reload
systemctl enable ws-stunnel
systemctl restart ws-stunnel

#edu-openssh
wget -O /usr/local/bin/edu-openssh "https://raw.githubusercontent.com/syapik96/aws/main/lain2/edu-openssh.py"
chmod +x /usr/local/bin/edu-openssh

# Installing Service
cat > /etc/systemd/system/edu-openssh.service <<END
[Unit]
Description=Python Openssh Proxy Websocket
Documentation=https://gilergames.tk
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-openssh
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-openssh
systemctl restart edu-openssh
