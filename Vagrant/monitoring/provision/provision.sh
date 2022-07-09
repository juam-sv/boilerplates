# Garantindo as chaves
#  ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.0.0.10 master.monitoring.lab' >> /etc/hosts
echo '10.0.0.11 node01.monitoring.lab' >> /etc/hosts
echo '10.0.0.12 node02.monitoring.lab'>> /etc/hosts
echo '10.0.0.13 registry.monitoring.lab' >> /etc/hosts

curl -fsSL https://get.docker.com | bash
systemctl start docker
systemctl enable docker
usermod -aG docker vagrant
