#!/bin/bash
# Script mod updated by prince

clear
echo -e " "
echo -e " =========[ Check Limit Status ]========" | lolcat;
echo -e " ";
if [ -e "/root/log-limit.txt" ]; then
echo -e "  Pengguna Yang Melanggar Batas Maksimum" | lolcat;
echo -e "   Waktu - Username - Banyak Multilogin " | lolcat
echo -e " ---------------------------------------" | lolcat;
cat /root/log-limit.txt
else
echo -e " \e[1;31mTidak ada pengguna yang melakukan pelanggaran\e[0m"
echo -e " "
echo -e " atau"
echo -e " "
echo -e " \e[1;31mScript User-Limit belum dijalankan\e[0m"
fi
echo -e " ";
echo -e " =======================================" | lolcat;
echo -e " ";
