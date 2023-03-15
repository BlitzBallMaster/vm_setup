#!/bin/bash

echo "Checking if initial VMs are already created"
qm list

echo -e "These are the current VMs created.\n\nCreating the remainder VMs now"
#qm create 100 --name General --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
qm create 150 --name Kali --cdrom local:iso/kali-linux-2023.1-installer-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
qm create 151 --name Commando --cdrom local:iso/Windows_10_x64.iso --scsi0 VM-Main:64 --ostype win10 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
#qm create 152 --name Caldera --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Main:64 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
#qm create 201 --name SIEM --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:512 --ostype l26 --memory 16384 --sockets 2 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
#qm create 202 --name Logger --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:768 --ostype l26 --memory 24576 --sockets 3 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
#qm create 203 --name Cuckoo --cdrom local:iso/ubuntu-22.04.1-desktop-amd64.iso --scsi0 VM-Sec:256 --ostype l26 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
#qm create 204 --name ThreatPursuit --cdrom local:iso/Windows_10_x64.iso --scsi0 VM-Main:64 --ostype win10 --memory 8192 --sockets 1 --cores 4 --net0 virtio,bridge=vmbr0,firewall=0 --net1 virtio,bridge=vmbr1,firewall=0&
wait

echo -e "Setting static IPs for the VMs"
#qm set 100
qm set 150 --ipconfig0 gw=10.100.1.1,ip=10.100.10.150/24 --ipconfig1 gw=10.100.11.1,ip=10.100.11.150/24
#qm set 151
#qm set 152
#qm set 201
#qm set 202
#qm set 203
#qm set 204

echo -e "Finished creating VMs and setting static IPs for the following VMs"
qm list
