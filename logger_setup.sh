#!/bin/bash

#Set crontab
echo -e "0 2 * * 5 apt update\n0 3 * * 5 apt upgrade -y\n0 4 * * 5 shutdown -r" > mycron
crontab mycron
