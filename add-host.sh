#!/bin/bash
### 🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰 ###
### Script Update by : t.me/PrinceNewbie ####
read -rp "Domain/Host: " -e host
echo "IP=$host">>/var/lib/premium-script/ipvps.conf

