#!/bin/bash

#Set crontab
echo -e "Setting up crontab"
echo -e "0 0 * * 0 bash /home/tidus/Documents/git/general_cron.sh" > mycron
crontab mycron
