#!/bin/bash

echo -e "Which VM are we focused on today?"

select opt in "List VMs again" "WhiteList ProxMox" "General" "Kali" "Commando" "Caldera" "SIEM" "Logger" "Cuckoo" "Threat Pursuit" "Terminate"
do
case $opt in
	"List VMs again"
		echo "Listing VMs again"
		qm list | awk '{print $1,$2}'
		;;
	"WhiteList ProxMOx"
		echo "Run the following commands to whitelist ProxMox for SSH and setting up SSH"
		echo -e "Step 1. (Whitelist ProxMox)\napt install openssh-server-y \ndpkg-reconfigure openssh-server\n\"echo \"sshd:10.100.10.1\" >> /etc/hosts.allow\necho \"sshd: ALL >> /etc/hosts.deny\""
		echo -e "Step 2. (Enable SSH)\nsystemctl start ssh.socket"
		;;
	"General"
		
		;;
	"Kali"
		echo -e "Step 1. (Static IPs)\nOpen console through ProxMox to run the following commands.\n ifconfig eth0 10.100.10.150 netmask 255.255.255.0\n ifconfig eth1 10.100.11.150 netmask 255.255.255.0 \n route add default gw 10.100.10.1"
		;;
	"Commando"
		
		;;
	"Caldera"
		echo -e "Step 1. (Static IPs)\nOpen console through ProxMox to run the following commands.\n apt install net-tools -y\nifconfig ens18 10.100.10.152 netmask 255.255.255.0\n ifconfig ens19 10.100.11.152 netmask 255.255.255.0\nroute add default gw 10.100.10.1"
		;;
	"SIEM"
		
		;;
	"Logger"
		
		;;
	"Cuckoo"
		
		;;
	"Threat Pursuit"
		
		;;
	"Terminate"
		echo "Closing script"
		exit
		;;
