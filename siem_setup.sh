#!/bin/bash

##### Setup Steps in echos#####

#Set crontab
echo -e "Step 1.\nSetting up crontab"
echo -e "0 2 * * 4 apt update && apt upgrade -y && shutdown -r" > mycron
crontab mycron

# Pulling Containers
echo -e "Pulling Splunk container"


echo -e "Pulling ELK Container"
