#!/bin/bash

yum update -y
yum install -y epel-release
yum install -y ansible wget git htop vim 

wget https://releases.ansible.com/ansible-tower/setup-bundle/ansible-tower-setup-bundle-latest.tar.gz 

tar -xzvf ansible-tower-*.tar.gz

# sed -i 's/admin_password=\'\'/admin_password=\'super@senha\'/g' ansible-tower-setup*/inventory
sed -i "s/admin_password=''/admin_password='super@senha'/g" inventory
sed -i "s/pg_password=''/pg_password='super@senha'/g" inventory

