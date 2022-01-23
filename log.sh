echo ""
echo "============================-{ Autoscript By Prince }-=========================" | lolcat | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | lolcat | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, X40000"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 445, 777(stunnel+ssh)"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143, 69"  | tee -a log-install.txt
echo "   - WebSocket/WS SSL        : 443"  | tee -a log-install.txt
echo "   - WebSocket/WS Http       : 80"  | tee -a log-install.txt
echo "   - WebSocket/WS Ovpn       : 2099"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080, 8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300, 7400, 7500"  | tee -a log-install.txt
echo "   - Nginx                   : 81(OVPN CONFIG WEB)"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 880"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 2052"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Timezone                : Asia/Singapore (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Autoreboot On 00.05 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================-[ COPYRIGHT © 2022 ]-===========================" | tee -a log-install.txt
echo "===================-[ POWERED BY PRINCE`AKA`SYAPIK96 ]-====================" | tee -a log-install.txt
