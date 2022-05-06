#!/bin/bash

sudo adduser bitwarden
#sudo passwd bitwarden #change
usermod --password supersenha bitwarden
sudo groupadd docker
sudo usermod -aG docker bitwarden
sudo mkdir /opt/bitwarden
sudo chmod -R 700 /opt/bitwarden
sudo chown -R bitwarden:bitwarden /opt/bitwarden


#install 
curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod 700 bitwarden.sh
./bitwarden.sh install