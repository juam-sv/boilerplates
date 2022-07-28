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