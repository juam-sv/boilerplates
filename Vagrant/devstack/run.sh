#!/bin/bash
cp /home/publico/focal-server-cloudimg-amd64-disk-kvm.img . #localização da cloud-image
qemu-img resize focal-server-cloudimg-amd64-disk-kvm.img 50g #aumenta o tamanho
cloud-localds -v test1-seed.img devstack.cfg #converto o arquivo do cloud-init para disco
virt-install --name devstack-1 \
  --virt-type kvm --memory 6144 --vcpus 4 \
  --disk path=/var/lib/libvirt/images/focal-server-cloudimg-amd64.img,device=disk \
  --disk path=test1-seed.img,device=cdrom,bus=scsi \
  --os-type linux --os-variant ubuntu20.04 \
  --network network=default\
  --graphics none \
  --import
