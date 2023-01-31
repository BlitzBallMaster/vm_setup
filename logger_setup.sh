#!/bin/bash

##### Setup Steps in echos#####

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 5 apt update\n0 3 * * 5 apt upgrade -y\n0 4 * * 5 shutdown -r" > mycron
crontab mycron

#Pull Containers
echo -e "Pulling Suricata container"
docker pull jasonish/suricata
echo -e "Pulling Zeek container"
mkdir /home/yuna/zeek
cd /home/yuna/zeek
git clone git@github.com:zeek/zeek-docker.git
cd /home/yuna/zeek/zeek-docker
make build-stamp_4.2.0
echo -e "Pulling ntop container"
docker run -it -p 3000:3000 -v $(pwd)/ntopng.license:/etc/ntopng.license:ro --net=host ntop/ntopng:latest -i eth0

