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

echo -e "Pulling ntop container"

