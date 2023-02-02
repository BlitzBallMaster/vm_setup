#!/bin/bash

sleep 5m
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_rsa_BBM

