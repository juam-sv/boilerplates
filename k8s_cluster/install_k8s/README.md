ansible -i hosts node-1.ansible.lab -m apt -a "update_cache=yes name=cmatrix state=present" -b -k

-m module
-a arguments 
-b become
-k require password

ansible -i hosts node-1.ansible.lab -m shell -a "uptime"

ansible -i hosts node-1.ansible.lab -m copy -a "src=arquivo_local dest=/destino_remoto"

ansible -i hosts node-1.ansible.lab -m git -a "repo=linkdorepo/new_folder dest=/home/ubuntu version=head

#get facts/information sobre o host
ansible -i hosts node-1.ansible.lab -m setup

ansible -i hosts all -m setup -a "filter=ansible_distribution"

# playbooks
ansible-playbook -i hosts first.yaml

#create the roles
ansible-galaxy init create-instances

#ignore key checking
#1 - put it on /etc/ansible.cfg or on ~/.ansible.cfg
[defaults]
host_key_checking = False

#enviroment export ANSIBLE_HOST_KEY_CHECKING=False

# NOTES
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

ansible-playbook -i hosts main.yml --tags "install_helm3_role,install_monit_tools.yml" --list-tasks

chmod go-r ~/.kube/config

kubectl --namespace default get pods -l "release=prometheus"