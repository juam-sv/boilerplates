#!/bin/bash

echo "Running nmap scan to get up hosts"



nmap -n -sn 192.168.122.0/24 -oG - | awk '/Up$/{print $2}' > myInventory 
ansible -u vagrant -i myInventory all -m ping
