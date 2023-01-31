#!/bin/bash

##### Setup Steps in echos#####

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 5 apt update\n0 3 * * 5 apt upgrade -y\n0 4 * * 5 shutdown -r" > mycron
crontab mycron

# Installing make
echo -e "Installing make"
apt install make -y


#Pull and Create Containers
echo -e "Pulling and Creating Suricata container"
docker pull jasonish/suricata
docker run --name suricata --rm -it -d --net=host --cap-add=net_admin --cap-add=net_raw --cap-add=sys_nice jasonish/suricata:latest -i ens18 -i ens19
echo -e "Pulling and Creating Zeek container"
mkdir -p /home/yuna/zeek
cd /home/yuna/zeek
git clone https://github.com/zeek/zeek-docker.git
cd /home/yuna/zeek/zeek-docker
make build-stamp_4.2.0
docker run --name zeek -it -d  --net=host broplatform/bro:latest -i ens18 -i ens19
echo -e "Pulling and Creating ntop container"
mkdir -p /home/yuna/ntop
cd /home/yuna/ntop
docker pull ntop/ntopng
docker run --name ntopng -it -d -p 3000:3000 --net=host ntop/ntopng:latest -i ens18 -i ens19

#Ensure static ips
echo "Rerunning netplan to ensure static IPs that changed go to intended static IPs"
netplan apply

#Configuring Suricata
echo -e "Configuring suricata container"

#Configuring Zeek
echo -e "Configuring zeek container"

#Configuring ntopng
echo -e "Configuring ntopng container"

#Container persistence
echo -e "Setting containers to restart at reboot"
docker update --restart unless-stopped suricata zeek ntopng

#cron script (replace crontab to include updates & reboot)
echo -e "Setting bash script to run at set time"

