#!/bin/bash
read -rp "Domain/Hostname: " -e host
echo "IP=$host">>/var/lib/premium-script/ipvps.conf
