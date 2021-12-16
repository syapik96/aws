#!/bin/bash
# Script Mod By Prince
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     AutoKick Mod by Prince      "
echo -e ""
echo -e "     [1]  AutoKick After 5 Minutes"
echo -e "     [2]  AutoKick After 15 Minutes"
echo -e "     [3]  AutoKick After 30 Minutes"
echo -e "     [4]  Turn Off AutoKick/MultiLogin"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"                                                                                                          
echo -e ""
read -p "     Select From Options [1-4 or x] :  " AutoKick
echo -e ""
case $AutoKick in
                1)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e "      AutoKick Mod by Prince    "
                echo -e ""
                echo -e "      Allowed MultiLogin : 2"
                echo -e "      AutoKick Every     : 5 Minutes"      
                echo -e ""
                echo -e "======================================"                                                                                                                                 
                exit                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoKick Mod by Prince     "
                echo -e ""
                echo -e "      Allowed MultiLogin : 2"
                echo -e "      AutoKick Every     : 15 Minutes"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoKick Mod by Prince     "
                echo -e ""
                echo -e "      Allowed MultiLogin : 2"
                echo -e "      AutoKick Every     : 30 Minutes"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                rm -f /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoKick Mod by Prince     "
                echo -e ""
                echo -e "      AutoKick MultiLogin Turned Off  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac

