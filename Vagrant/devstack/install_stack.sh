#!/bin/bash

sudo apt update -y && sudo apt upgrade -y && sudo apt install -y git

sudo useradd -s /bin/bash -d /opt/stack -m stack

echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

sudo -u stack -i

git clone https://git.openstack.org/openstack-dev/devstack 

myip=$(ip -4 -o addr show eth0 | awk '{print $4}' | cut -d "/" -f 1)

cat << EOF > ~/devstack/local.conf
[[local|localrc]]

# Password for KeyStone, Database, RabbitMQ and Service
ADMIN_PASSWORD=super@senha
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD

# Host IP - get your Server/VM IP address from ip addr command
#HOST_IP=$myip
EOF

#bash /devstack/stack.sh