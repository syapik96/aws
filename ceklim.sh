#!/bin/bash
clear
echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "Pengguna Yang Melanggar Batas Maksimum";
echo "Waktu - Username - Banyak Multilogin"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " Tidak ada pengguna yang melakukan pelanggaran"
echo " "
echo " atau"
echo " "
echo " Script User-Limit belum dijalankan"
fi
echo " ";
echo "===========================================";
echo "Mod BY SL";
echo " ";