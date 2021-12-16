<h2 align="center">AutoScript Install SSH & OpenVPN & V2rayXray & SSR & Trojan & WireGuard For Debian VPS By PrinceNewbie <img src="https://img.shields.io/badge/Version-2.0.4-blue.svg"></h2>


<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=red"></p>

<p align="center"><img src="https://img.shields.io/badge/Service-OpenSSH-success.svg">  <img src="https://img.shields.io/badge/Service-Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-Privoxy-green.svg">   <img
src="https://img.shields.io/badge/Service-V2ray-success.svg">  <img src= "https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan-success.svg">  <img src="https://img.shields.io/badge/Service-WireGuard-success.svg">

## Commands : <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=powershell&label=Shell&message=Bash%20Script&color=lightgray">


## Installation 

##   <img src="https://img.shields.io/badge/Service-Update%20Dulu-green"> 
  ```html
apt-get update && apt-get upgrade -y && update-grub && reboot
  ```
##  <img src="https://img.shields.io/badge/Install Semua-VPN%20Batch-green">
  
  ```html

wget https://raw.githubusercontent.com/syapik96/aws/main/setup.sh 
chmod +x setup.sh 
./setup.sh
  ```
##    <img src="https://img.shields.io/badge/Install%20Hanya-SSH%2FSSH%20SSL(Stunnel)%20SSH--WS%20Python%20BadVPN--UDPGW-green">
	 
   ```html
wget https://raw.githubusercontent.com/syapik96/aws/main/install/sshonly.sh
chmod +x sshonly.sh  
./sshonly.sh
  ```
 
Info :
	       
 Fork first , then change this .
 Replace all this with your own acc name :
	     
> > GitUser="syapik96" 
	    
jika terdapat masalah please pull issue , 
please jika ada kesilapan dalam skrip dialukan utk betulkan
thanks for those fork 
	
SILA BACA TEXT BERSIMBOL #              
UNTUK BAGI MEMUDAHKAN 
YANG INGIN MENGGUNAKAN SKRIP INI 
	
🔰 POWERED BY PRINCENEWBIE. 🔰     
🔰 COPYRIGHT © 2021 OnePieceVPN, Inc 🔰	#				 
	
	
## Description :

  Service & Port

- OpenSSH                  : 22,500
- SSH-WS Python OpenSSH    : 100
- SSH-WS Python Dropbear   : 2020,2021
- SSH-WS Python SSL/TLS    : 5052,5053
- OpenVPN-WS Python        : 6969
- OpenVPN                  : TCP 1194, UDP 2200, SSL 992
- Stunnel4 SSL/TLS         : 443
- Dropbear                 : 143,109
- Squid Proxy              : 3128,8000,8080 (limit to IP Server)
- Badvpn                   : 7100,7200,7300
- Nginx                    : 81
- Wireguard                : 7070
- L2TP/IPSEC VPN           : 1701
- PPTP VPN                 : 1732
- SSTP VPN                 : 5555
- Shadowsocks-R            : 1443-1543
- SS-OBFS TLS              : 2443-2543
- SS-OBFS HTTP             : 3443-3453
- V2RAY Vmess TLS          : 8443
- V2RAY Vmess None TLS     : 80
- V2RAY Vless TLS          : 2083
- V2RAY Vless None TLS     : 8880
- Trojan                   : 2087

  
  

## Credit :
  
*   Original Script by  Horas
*   Modded Script by    t.me/PrinceNewbie
	
	
	            
	
	   <img src="https://img.shields.io/badge/%20COPYRIGHT%20%C2%A9%202021-%20By%20PrinceNewbie%20OnePieceVPN%2C%20Inc-blue">
