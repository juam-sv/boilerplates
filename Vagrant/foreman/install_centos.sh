#!/bin/bash

echo "Installing The Foreman"
echo "Updating Packages"i
sudo yum update -y

echo "Installing puppet and others dependencies"
sudo yum -y install https://yum.puppet.com/puppet7-release-el-7.noarch.rpm

echo "Enabling the foreman repository"
sudo yum-config-manager --enable extras
sudo yum -y install epel-release centos-release-scl-rh
sudo yum -y install https://yum.theforeman.org/releases/3.2/el7/x86_64/foreman-release.rpm

echo "Update hosts file"
myip=$(ip -4 -o addr show eth0 | awk '{print $4}' | cut -d "/" -f 1)
echo "$myip foreman.lab.local" >> /etc/hosts
sudo hostnamectl set-hostname  $(hostname).seasolutions.com.br

echo "Testing hostname/ip"
ping -c 4 $(hostname -f)

echo "Installing the foreman packages"
sudo yum -y install foreman-installer

echo "Running foreman-installer"
sudo foreman-installer
