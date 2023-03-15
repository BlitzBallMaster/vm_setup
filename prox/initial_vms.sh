#!/bin/bash

echo "Checking if initial VMs are already created"
qm list

echo -e "These are the current VMs created.\n\nCreating the remainder VMs now"
qm create 150 --name Kali --cdrom local:iso/kali-linux-2023.1-installer-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
wait
echo -e "Setting static IPs for the VMs"


echo -e "Finished creating VMs and setting static IPs for the following VMs"
qm list
