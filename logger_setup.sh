#!/bin/bash

##### Setup Steps in echos#####

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 5 apt update\n0 3 * * 5 apt upgrade -y\n0 4 * * 5 shutdown -r" > mycron
crontab mycron

# Installing make
echo -e "Installing make"
apt install make -y


#Pull Containers
echo -e "Pulling Suricata container"
docker pull jasonish/suricata
echo -e "Pulling Zeek container"
mkdir -p /home/yuna/zeek
cd /home/yuna/zeek
git clone https://github.com/zeek/zeek-docker.git
cd /home/yuna/zeek/zeek-docker
make build-stamp_4.2.0
echo -e "Pulling ntop container"
mkdir -p /home/yuna/ntop
cd /home/yuna/ntop
docker pull ntop/ntopng
docker run -it -d -p 3000:3000 --net=host ntop/ntopng:latest -i ens18
