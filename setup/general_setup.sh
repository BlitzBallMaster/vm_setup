#!/bin/bash

#Set crontab
echo -e "Setting up crontab"
echo -e "0 0 * * 0 bash /home/tidus/Documents/git/cron/general_cron.sh" > mycron
echo -e "@reboot bash /home/tidus/Documents/git/cron/general_cron2.sh" >> mycron
crontab mycron
