#!/bin/bash

echo "Add folders to system..."

mkdir /{publico,admin,ven,sec}

echo GRP_ADM GRP_VEN GRP_SEC | xargs -n 1 groupadd -r

users="carlos maria joao"
for i in $users
do 
    useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

users2="debora sebastiana roberto"
for i in $users2
do 
    useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
done

users3="josefina amanda rogerio"
for i in $users3
do 
    useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
done

echo "chaging folder permissions"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico
