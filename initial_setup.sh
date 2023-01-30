#!/bin/bash

# Choose VM
echo -e "What VM are you in today?\nAnswer with number\n100. General\n152. Caldera\n201. SIEM\n202. Logger\n203. Cuckoo\n240. Training"
read vmnum

#Set static IP
echo "Setting static IPs for VM ID.$vmnum"
cp /etc/netplan/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml.bak
echo -e "# Let NetworkManager manage all devices on this system\nnetwork:\n  version: 2\n  ethernets:\n    ens18:\n      dhcp4: no\n      addresses:\n        - 10.100.10.$vmnum/24\n      gateway4: 10.100.10.1\n      nameservers:\n          addresses: [10.100.1.12, 10.100.1.13, 10.100.1.1]\n    ens19:\n      dhcp4: no\n      addresses:\n        - 10.100.11.$vmnum/24\n      gateway4: 10.100.11.1\n      nameservers:\n          addresses: [10.100.1.12, 10.100.1.13, 10.100.1.1]" > /etc/netplan/01-network-manager-all.yaml
netplan apply
