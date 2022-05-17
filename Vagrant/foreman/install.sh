#!/bin/bash

echo "Installing The Foreman"
echo "Updating Packages"i
sudo apt update -y ; sudo apt dist-upgrade -y

echo "Installing puppet and others dependencies"
sudo apt-get -y install ca-certificates
cd /tmp && wget https://apt.puppet.com/puppet6-release-focal.deb
sudo dpkg -i /tmp/puppet6-release-focal.deb

echo "Enabling the foreman repository"
echo "deb http://deb.theforeman.org/ focal 3.1" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 3.1" | sudo tee -a /etc/apt/sources.list.d/foreman.list
sudo apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -

echo "Update hosts file"
myip=$(ip -4 -o addr show eth0 | awk '{print $4}' | cut -d "/" -f 1)
echo "$myip foreman.lab.local" >> /etc/hosts
hostnamectl set-hostname foreman.lab.local

echo "Testing hostname/ip"
ping -c 4 $(hostname -f)

echo "Installing the foreman packages"
sudo apt-get update -y && sudo apt-get -y install foreman-installer -y

echo "Running foreman-installer"
sudo foreman-installer
