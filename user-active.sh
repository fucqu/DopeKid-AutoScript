#!/bin/bash
#Licensed to https://www.facebook.com/joash.singh.90
#Script by DopeKid

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.4
echo "Checking Permision..."
sleep 0.4
CEK=DopeKid
if [ "$CEK" != "DopeKid" ]; then
		echo -e "${red}Permission Denied!${NC}";
        echo $CEK;
        exit 0;
else
echo -e "${green}Permission Accepted...${NC}"
sleep 1
clear
fi

echo " "
echo " "
echo " "
read -p "Iput Username to Renew  : " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "How many days to extend?: " masa_aktif

today=`date +%s`
masa_aktif_detik=$(( $masa_aktif * 86400 ))
saat_expired=$(($today + $masa_aktif_detik))
tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')
clear
echo "Connecting to Server..."
sleep 0.5
echo "Adding time..."
sleep 0.5
passwd -u $username
usermod -e  $tanggal_expired $username
  egrep "^$username" /etc/passwd >/dev/null
  echo -e "$password\n$password" | passwd $username
  clear
  echo " "
  echo " "
  echo "---------------------------------------"
  echo "       Extended Account Details        "
  echo "---------------------------------------"
  echo "   Username        : $username"
  echo "   Active Time     : $masa_aktif Days"
  echo "   Date Expired    : $tanggal_expired_display"
  echo "--------------------------------------"
  echo " "

else
echo -e "Username ${red}$username${NC} not found in your VPS"
exit 0
fi