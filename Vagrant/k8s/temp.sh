        apt update -y
        apt install -y docker.io docker-compose
        sudo systemctl enable docker
        sudo systemctl start docker
        sudo usermod -aG docker vagrant
        #sudo reboot
        #instalar o docker manualmente e kubernets
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get update -y
        sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
        sudo apt-mark hold docker-ce
        cat > /etc/docker/daemon.json <<EOF
        { "exec-opts": ["native.cgroupdriver=systemd"],
          "log-driver": "json-file",
          "log-opts": {
            "max-size": "100m"},
          "storage-driver": "overlay2"}
        EOF
        mkdir -p /etc/systemd/system/docker.service.d
        systemctl daemon-reload
        systemctl restart docker

        #instalar 
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
        deb https://apt.kubernetes.io/ kubernetes-xenial main
        EOF
        sudo apt-get update -y
        sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00
        sudo apt-mark hold kubelet kubeadm kubectl
        sudo swapoff -a 
        sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
