#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/stack
sudo git clone https://opendev.org/openstack/devstack /opt/stack/devstack
sudo echo '[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
HOST_IP=192.168.122.3
FLAT_INTERFACE=eth1
FLOATING_RANGE=192.168.0.224/27
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
SWIFT_REPLICAS=1


enable_service s-proxy s-object s-container s-account
enable_plugin heat https://opendev.org/openstack/heat
enable_plugin heat-dashboard https://opendev.org/openstack/heat-dashboard
enable_plugin magnum https://opendev.org/openstack/magnum
enable_plugin magnum-ui https://opendev.org/openstack/magnum-ui' > /opt/stack/devstack/local.conf
sudo chown stack:stack -R /opt/stack