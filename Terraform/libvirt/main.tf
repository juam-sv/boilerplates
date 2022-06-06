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

    # autostart = true

    disk {
        volume_id = libvirt_volume.centos7-qcow2.id
    }

    cloudinit = libvirt_cloudinit_disk.commoninit.id

    network_interface {
        network_name = "default"
        # bridge = "br0"
    }

    qemu_agent = true
}

output "IPS" {
    # value = libvirt_domain.terraform_test.ip_addresses
    value = libvirt_domain.terraform_test.*.network_interface.0.addresses
}

resource "libvirt_cloudinit_disk" "commoninit" {
    name      = "commoninit.iso"
    pool      = "default"
    user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
}