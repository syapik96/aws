#!/bin/bash
# Mod by SL
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "           Script Mod by SL           "
echo -e ""
echo -e "    [1] Restart All Services"
echo -e "    [2] Restart OpenSSH"
echo -e "    [3] Restart Dropbear"
echo -e "    [4] Restart Stunnel4"
echo -e "    [5] Restart OpenVPN"
echo -e "    [6] Restart Squid"
echo -e "    [7] Restart Nginx"
echo -e "    [8] Restart Badvpn"
echo -e "    [9] Restart SSH Over Websocket Python"
echo -e "    [x] Exit"
echo -e ""
read -p "    Select From Options [1-9 or x] :  " Restart
echo -e ""
echo -e "======================================"
sleep 1
clear
case $Restart in
                1)
                clear
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
		/etc/init.d/sslh restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/webmin restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
		systemctl daemon-reload
		systemctl enable ws-openssh.service
		systemctl start ws-openssh.service
		systemctl restart ws-openssh.service
		systemctl enable ws-dropbear.service
		systemctl start ws-dropbear.service
		systemctl restart ws-dropbear.service
		systemctl enable ws-stunnel.service
		systemctl start ws-stunnel.service
		systemctl restart ws-stunnel.service
		systemctl enable ws-ovpn.service
		systemctl start ws-ovpn.service
		systemctl restart ws-ovpn.service
		/etc/init.d/sshd restart
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "         All Service Restarted        "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
		/etc/init.d/sshd restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "         SSH Service Restarted        "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "       Dropbear Service Restarted     "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
		/etc/init.d/sshl restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "        Stunnel4 Service Restarted    "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "       OpenVPN Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "        Squid Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "         Nginx Service Restarted      "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                8)
                clear
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                9)
                clear
		systemctl daemon-reload
		systemctl enable ws-openssh.service
		systemctl start ws-openssh.service
		systemctl restart ws-openssh.service
		systemctl enable ws-dropbear.service
		systemctl start ws-dropbear.service
		systemctl restart ws-dropbear.service
		systemctl enable ws-stunnel.service
		systemctl start ws-stunnel.service
		systemctl restart ws-stunnel.service
		systemctl enable ws-ovpn.service
		systemctl start ws-ovpn.service
		systemctl restart ws-ovpn.service
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "           Script Mod by SL           "
                echo -e ""
                echo -e " SSH Over WS Python Service Restarted "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
