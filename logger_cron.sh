#!/bin/bash

apt update
apt upgrade -y
docker container stop suricata zeek ntopng
shutdown -r

