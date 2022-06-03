#!/bin/bash

echo "Installing Ansible AWX"
echo "fastestmirror=1
max_parallel_downloads=8" >> /etc/dnf/dnf.conf


yum update -y
dnf install epel-release -y
yum install -y wget git htop vim 
dnf install git gcc gcc-c++ ansible nodejs gettext device-mapper-persistent-data lvm2 bzip2 python3-pip -y

#https://www.rogerperkin.co.uk/network-automation/ansible/how-to-install-ansible-awx/
#wget https://releases.ansible.com/ansible-tower/setup-bundle/ansible-tower-setup-bundle-latest.tar.gz 
wget https://github.com/ansible/awx/archive/refs/tags/17.1.0.zip
tar -xzvf ansible-tower-*.tar.gz
git clone -b 17.0.1 https://github.com/ansible/awx.git



# sed -i 's/admin_password=\'\'/admin_password=\'super@senha\'/g' ansible-tower-setup*/inventory
sed -i "s/admin_password=''/admin_password='super@senha'/g" inventory
sed -i "s/pg_password=''/pg_password='super@senha'/g" inventory

