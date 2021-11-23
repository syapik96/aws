#!/bin/bash
# Mod by syapik96

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'


clear
echo -e ""
echo -e "======================================"| lolcat 
echo -e ""
echo -e "           \e[1;32mScript Mod by syapik96\e[0m           "
echo -e ""
echo -e "    $bl[\e[m$bd1$bl]\e[m$bd Restart All Services"
echo -e "    $bl[\e[m$bd2$bl]\e[m$bd Restart OpenSSH"
echo -e "    $bl[\e[m$bd3$bl]\e[m$bd Restart Dropbear"
echo -e "    $bl[\e[m$bd4$bl]\e[m$bd Restart Stunnel4"
echo -e "    $bl[\e[m$bd5$bl]\e[m$bd Restart OpenVPN"
echo -e "    $bl[\e[m$bd6$bl]\e[m$bd Restart Squid"
echo -e "    $bl[\e[m$bd7$bl]\e[m$bd Restart Nginx"
echo -e "    $bl[\e[m$bd8$bl]\e[m$bd Restart Badvpn"
echo -e "    $bl[\e[m$bd9$bl]\e[m$bd Restart SSH Over Websocket Python"
echo -e "    $bl[\e[m$bdx$bl]\e[m$bd Exit"
echo -e ""
read -p "    Select From Options [1-9 or x] :  " Restart
echo -e ""
echo -e "======================================"| lolcat
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
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "         Script Mod by syapik96           "
                echo -e ""
                echo -e "         All Service Restarted        "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                2)
                clear
                /etc/init.d/ssh restart
		/etc/init.d/sshd restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "         Script Mod by syapik96           "
                echo -e ""
                echo -e "         SSH Service Restarted        "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                3)
                clear
                /etc/init.d/dropbear restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "         Script Mod by syapik96           "
                echo -e ""
                echo -e "       Dropbear Service Restarted     "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                4)
                clear
                /etc/init.d/stunnel4 restart
		/etc/init.d/sshl restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "          Script Mod by syapik96           "
                echo -e ""
                echo -e "        Stunnel4 Service Restarted    "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                5)
                clear
                /etc/init.d/openvpn restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "        Script Mod by syapik96           "
                echo -e ""
                echo -e "       OpenVPN Service Restarted      "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                6)
                clear
                /etc/init.d/squid restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "         Script Mod by syapik96           "
                echo -e ""
                echo -e "        Squid Service Restarted      "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                7)
                clear
                /etc/init.d/nginx restart
                echo -e ""
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "         Script Mod by syapik96           "
                echo -e ""
                echo -e "         Nginx Service Restarted      "
                echo -e ""
                echo -e "======================================"| lolcat
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
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "           Script Mod by syapik96           "
                echo -e ""
                echo -e "    Badvpn  Badvpn Service Restarted  "
                echo -e ""
                echo -e "======================================"| lolcat
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
                echo -e "======================================"| lolcat
                echo -e ""
                echo -e "       Script Mod by syapik96           "
                echo -e ""
                echo -e " SSH Over WS Python Service Restarted "
                echo -e ""
                echo -e "======================================"| lolcat
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
