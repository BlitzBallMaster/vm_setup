#!/bin/bash

echo "Checking if initial VMs are already created"
qm list

echo -e "These are the current VMs created.\n\nCreating the remaining VMs and setting MACs"
#qm create 100 --name General --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:10,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:10,bridge=vmbr1,firewall=0&
qm create 150 --name Kali --cdrom local:iso/kali-linux-2023.1-installer-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:15,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:15,bridge=vmbr1,firewall=0&
#qm create 151 --name Commando --cdrom local:iso/Windows_10_x64.iso --sata0 VM-Main:64 --ostype win10 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:1A,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:1A,bridge=vmbr1,firewall=0&
#qm create 152 --name Caldera --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:1B,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:1B,bridge=vmbr1,firewall=0&
#qm create 201 --name SIEM --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:512 --ostype l26 --memory 16384 --sockets 2 --cores 4 --net0 virtio=CE:A6:1A:16:FD:21,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:21,bridge=vmbr1,firewall=0&
#qm create 202 --name Logger --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:768 --ostype l26 --memory 24576 --sockets 3 --cores 4 --net0 virtio=CE:A6:1A:16:FD:22,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:22,bridge=vmbr1,firewall=0&
#qm create 203 --name Cuckoo --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:256 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:23,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:23,bridge=vmbr1,firewall=0&
#qm create 204 --name ThreatPursuit --cdrom local:iso/Windows_10_x64.iso --sata0 VM-Main:64 --ostype win10 --memory 8192 --sockets 1 --cores 4 --net0 virtio=CE:A6:1A:16:FD:24,bridge=vmbr0,firewall=0 --net1 virtio=76:D3:BA:30:24:24,bridge=vmbr1,firewall=0&
wait

echo -e "Finished creating the following VMs and setting Macs"
qm list | awk '{print $1,$2}'

echo -e "Starting the VMs"
qm start 100&
qm start 150&
qm start 151&
qm start 152&
qm start 201&
qm start 202&
qm start 203&
qm start 204&

echo -e "Copying Ansible hosts file over"
cp ./prox/hosts /etc/ansible/hosts

echo -e "If you want to run the ansible playbook now, just wait 5 seconds, otherwise hit Ctrl + C"
sleep 5
#ansible-playbook ./prox/initial_vms.yaml
