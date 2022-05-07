# vagrantfiles

Command                | Description
:----------------------:| ---------------------------------------
`vagrant init`          | Gera o VagrantFile
`vagrant box add <box>` | Baixar imagem do sistema
`vagrant box status`    | Verificar o status dos boxes criados
`vagrant up`            | Cria/Liga as VMs baseado no VagrantFile
`vagrant provision`     | Provisiona mudanças logicas nas VMs
`vagrant status`        | Verifica se VM está ativa/desativa/não criada.
`vagrant global-status` | Verifica os status de todas as VMs.
`vagrant ssh <vm>`      | Acessa a VM
`vagrant ssh <vm> -c <comando>` | Executa comando via ssh
`vagrant ssh-config <vm>` | Exibe as configurações do ssh.
`vagrant reload <vm>`   | Reinicia a VM
`vagrant halt`          | Desliga as VMs

