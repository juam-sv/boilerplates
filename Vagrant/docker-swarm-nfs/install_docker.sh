#!/bin/bash

#get docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#add user to group and permissions
sudo systemctl enable docker

printf 'Waiting for Docker to start...\n\n'
sleep 5

printf '\nDocker installed successfully\n\n'
#get docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

sudo usermod --append --groups docker $USER
