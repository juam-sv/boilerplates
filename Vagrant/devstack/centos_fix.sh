#!/bin/bash

#fix repos for CentOS
#sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

#update system
sudo dnf config-manager --enable powertools
sudo dnf install -y centos-release-openstack-yoga # Replace yoga by the desired release name
sudo dnf update -y
sudo dnf install -y openstack-packstack
sudo packstack --allinone

sudo dnf install network-scripts -y


#disable firewall and services
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network
sudo setenforce 0
