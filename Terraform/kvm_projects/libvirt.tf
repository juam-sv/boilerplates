terraform {
    required_providers {
        libvirt = {
            source = "dmacvicar/libvirt"
        }
    }
}

# libvirt.tf
# add the provider
provider "libvirt" {
    uri = "qemu:///system"
}

#create a poll
resource "libvirt_pool" "ubuntu" {
    name = "ubuntu-pool"
    type = "dir"
    path = "/home/juamsv/boilerplates/Terraform/kvm_projects/libvirt_images/ubuntu-pool/"
}

# create image
resource "libvirt_volume" "imagem-qcow2" {
    name = "ubuntu-amd64.qcow2"
    pool = libvirt_pool.ubuntu.name
    source = "${path.module}/downloads/jammy-server-cloudimg-amd64-disk-kvm.img"
    format = "qcow2"
}

# create cloudinit disk and add to pool
resource "libvirt_cloudinit_disk" "commoninit" {
    name = "commominit.iso"
    pool = libvirt_pool.ubuntu.name
    user_data = data.template_file.user_data.rendered
}

# read the configuration
data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
}

#define the domain
resource "libvirt_domain" "test-domain" {

    #name unique of the domain
    name = "test-vm-ubuntu"
    memory = "1024"
    vcpu = "1"

    cloudinit = libvirt_cloudinit_disk.commoninit.id

    network_interface {
        network_name = "default"
    }

    console {
        type = "pty"
        target_type = "serial"
        target_port = "0"
    }

    disk {
        volume_id = libvirt_volume.imagem-qcow2.id
    }

    graphics {
        type = "spice"
        listen_type = "address"
        autoport = true
    }
}