#!/bin/bash

##### Setup Steps in echos#####

# Pulling Containers
echo -e "Pulling Splunk container"
docker pull splunk/splunk:latest
echo -e "Starting Splunk Container"
docker run --name splunk -it -d --restart unless-stopped --net=host -p 8000:8000 -e SPLUNK_START_ARGS='--accept-license' -e SPLUNK_PASSWORD='splunkadmin' splunk/splunk:latest -i ens18

echo -e "Pulling ELK Container"
docker pull sebp/elk
echo -e "Starting ELK Container"
docker run --name elk -it -d -d --restart unless-stopped --net=host -p 5601:5601 -p 9200:9200 -p 5044:5044 sebp/elk:latest -i ens18

#Set crontab
echo -e "Setting up crontab"
echo -e "0 2 * * 4 bash /home/wakka/git/vm_setup/cron/siem_cron.sh" > mycron
crontab mycron
