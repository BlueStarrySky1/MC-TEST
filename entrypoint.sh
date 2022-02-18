#!/bin/sh

# Global variables
DIR_CONFIG="/etc/mc"
DIR_RUNTIME="/usr/bin"

#Update
apt update -y
apt upgrade -y

#Get Jar
curl --retry 10 --retry-max-time 60 -fsSL http://download1496.mediafire.com/g6l2athok4tg/mnpj5537ett8kkx/1.18.zip - o ${DIR_CONFIG} /mc.zip
busybox unzip ${DIR_CONFIG}/mc.zip -d ${DIR_CONFIG}

#IP
apt install net-tools -y
ifconfig > ${DIR_CONFIG}/app.txt

#Start 
cd ${DIR_CONFIG}/mc
bash start.bat --nogui
