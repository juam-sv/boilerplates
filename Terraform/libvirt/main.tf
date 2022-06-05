terraform {
required_providers {
    libvirt = {
        source = "dmacvicar/libvirt"
    }
}
}

provider "libvirt" {
    uri = "qemu:///system"
}

resource "libvirt_volume" "centos7-qcow2" {
    name = "centos7-qcow2"
    pool = "default"
    source = "/var/lib/libvirt/images/CentOS-7-x86_64-GenericCloud.qcow2c"
    format = "qcow2"
    # capacity = "10"
    # provider = "libvirt"
}

resource "libvirt_domain" "terraform_test" {
    name = "terraform_test"
    memory = 2048
    vcpu = 2

    disk {
        volume_id = libvirt_volume.centos7-qcow2.id
    }

    network_interface {
        network_name = "default"
    }
}

output "IPS" {
    # value = libvirt_domain.terraform_test.ip_addresses
    value = libvirt_domain.terraform_test.*.network_interface.0.addresses
}