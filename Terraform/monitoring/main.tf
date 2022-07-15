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

# resource "libvirt_network" "monitoring-net" {
#     name = "monitoring-net"
#     domain = "monitoring.lab.local"
#     addresses = ["10.0.0.1/24"]
#     dhcp {
#         enable = true
#     }
# }

resource "libvirt_volume" "os-ubuntu-image" {
    name = "os-ubuntu-image"
    pool = "default"
    # type = "qcow2"
    # source_file = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
    source = "/var/lib/libvirt/images/focal-server-cloudimg-amd64.img"
}

#resized image
resource "libvirt_volume" "monitoring-vol" {
    name = "monitoring-1"
    pool = "default"
    # source = "/var/lib/libvirt/images/focal-server-cloudimg-amd64.img"
    base_volume_id = libvirt_volume.os-ubuntu-image.id
    format = "qcow2"
    size = 16106127360
    # size = "16106127360"
    # provider = "libvirt"
}

resource "libvirt_cloudinit_disk" "commoninit" {
    name      = "commoninit.iso"
    pool      = "default"
    user_data = data.template_file.user_data.rendered
}

resource "libvirt_domain" "monitoring-dom" {
    name = "monitoring_node-1"
    memory = 1024
    vcpu = 2
    qemu_agent = true
    # autostart = true

    disk {
        volume_id = libvirt_volume.monitoring-vol.id
        #file - (Optional) The filename to use as the block device for this disk (read-only)
        #block_device - (Optional) The path to the host device to use as the block device for this disk.
    }
    cloudinit = libvirt_cloudinit_disk.commoninit.id

    network_interface {
        network_name = "default"
        hostname = "master"
        # addresses = ["10.0.0.10"]
        # wait_for_lease = true
        # bridge = "br0"
    }
}

output "IPS" {
    # value = libvirt_domain.terraform_test.ip_addresses
    value = libvirt_domain.monitoring-dom.*.network_interface.0.addresses
}



data "template_file" "user_data" {
    template = file("${path.module}/cloud_init.cfg")
}