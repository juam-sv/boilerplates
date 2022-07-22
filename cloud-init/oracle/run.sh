#!/bin/bash

#wget https://yum.oracle.com/templates/OracleLinux/OL8/u6/x86_64/OL8U6_x86_64-kvm-b135.qcow
# qemu-img resize OL8U6_x86_64-kvm-b135.qcow 50g 

virsh destroy oracle-linux > /dev/null 
virsh undefine oracle-linux --remove-all-storage > /dev/null 

sudo rm -rf /var/lib/libvirt/images/cloud-init.img /var/lib/libvirt/images/OL8U6_x86_64-kvm-b135.qcow cloud-init.img

cloud-localds -v cloud-init.img oracle.cfg 

sudo rsync --info=progress2 OL8U6_x86_64-kvm-b135.qcow cloud-init.img /var/lib/libvirt/images/ 

virt-install --name oracle-linux \
  --virt-type kvm --memory 4096 --vcpus 4 \
  --disk path=/var/lib/libvirt/images/OL8U6_x86_64-kvm-b135.qcow,device=disk \
  --disk path=/var/lib/libvirt/images/cloud-init.img,device=cdrom,bus=scsi \
  --os-type linux --os-variant generic \
  --network network=default\
  --graphics spice \
  --import

virsh domifaddr oracle-linux