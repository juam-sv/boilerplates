#!/bin/bash

sudo dnf update -y
# sudo dnf config-manager --enable powertools
# sudo dnf install -y centos-release-openstack-yoga 
# sudo dnf update -y
# sudo dnf install -y openstack-packstack
# sudo packstack --allinone

sudo dnf install network-scripts -y

$ sudo systemctl disable firewalld
$ sudo systemctl stop firewalld
$ sudo systemctl disable NetworkManager
$ sudo systemctl stop NetworkManager
$ sudo systemctl enable network
$ sudo systemctl start network

dnf remove hiera -y
dnf config-manager --disable epel
dnf install -y openstack-packstack

- name: Reboot host and wait for it to restart
  reboot:
    msg: "Reboot initiated by Ansible"
    connect_timeout: 5
    reboot_timeout: 600
    pre_reboot_delay: 0
    post_reboot_delay: 30
    test_command: whoami