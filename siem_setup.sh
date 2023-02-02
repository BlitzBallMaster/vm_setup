#!/bin/bash

##### Setup Steps in echos#####

# Pulling Containers
echo -e "Pulling Splunk container"
docker

echo -e "Pulling ELK Container"

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 4 bash /home/yuna/git/vm_setup/logger_cron.sh" > mycron
crontab mycron
