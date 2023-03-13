#!/bin/bash

##### Setup Steps in echos#####

# Modify sysctl limits
echo -e "Modifying vm.max_map_count"
sysctl -w vm.max_map_count=262144
sysctl -p

# Pulling Containers
echo -e "Pulling Splunk container"
docker pull splunk/splunk:latest
echo -e "Starting Splunk Container"
docker run --name splunk -it -d --restart unless-stopped --net=host -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='splunkadmin' splunk/splunk:latest

echo -e "Pulling ELK Container"
docker pull sebp/elk
echo -e "Starting ELK Container"
docker run --name elk -it -d --restart unless-stopped --net=host -p 5601:5601 -p 9200:9200 -p 5044:5044 sebp/elk:latest

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 4 bash /home/wakka/git/vm_setup/cron/siem_cron.sh" > mycron
crontab mycron
