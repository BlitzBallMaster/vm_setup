#!/bin/bash

apt update
apt upgrade -y
docker container stop splunk elk
shutdown -r
