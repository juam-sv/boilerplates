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

resource "libvirt_volume" "ubuntu2004-qcow2" {
    name = "node-1"
    pool = "default"
    source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
    format = "qcow2"
    # capacity = "10"
    # provider = "libvirt"
}

resource "libvirt_domain" "monitoring" {
    name = "monitoring_node-1"
    memory = 1024
    vcpu = 2

    # autostart = true

    disk {
        volume_id = libvirt_volume.ubuntu2004-qcow2.id
    }

    cloudinit = libvirt_cloudinit_disk.commoninit.id

    network_interface {
        network_name = "monitoring"
        # bridge = "br0"
    }

    qemu_agent = true
}

output "IPS" {
    # value = libvirt_domain.terraform_test.ip_addresses
    value = libvirt_domain.monitoring.*.network_interface.0.addresses
}

resource "libvirt_cloudinit_disk" "commoninit" {
    name      = "commoninit.iso"
    pool      = "default"
    user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
}