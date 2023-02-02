#!/bin/bash


##### Setup Steps in echos#####

# Installing make
echo -e "Installing make"
apt install make -y

#Pull and Create Containers
echo -e "Pulling and Creating Suricata container"
docker pull jasonish/suricata
docker run --name suricata -it -d --net=host --cap-add=net_admin --cap-add=net_raw --cap-add=sys_nice jasonish/suricata:latest -i ens18 -i ens19
echo -e "Pulling and Creating Zeek container"
mkdir -p /home/yuna/zeek
cd /home/yuna/zeek
git clone https://github.com/zeek/zeek-docker.git
cd /home/yuna/zeek/zeek-docker
make build-stamp_4.2.0
docker run --name zeek -it -d -v 'pwd':/pcap broplatform/bro:latest /bin/bash
echo -e "Pulling and Creating ntop container"
mkdir -p /home/yuna/ntop
cd /home/yuna/ntop
docker pull ntop/ntopng
docker run --name ntopng -it -d -p 3000:3000 --net=host ntop/ntopng:latest -i ens18 -i ens19

#Ensure static ips
echo "Rerunning netplan to ensure static IPs that changed go to intended static IPs"
netplan apply

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 5 bash /home/yuna/git/vm_setup/logger_cron.sh" > mycron
crontab mycron



