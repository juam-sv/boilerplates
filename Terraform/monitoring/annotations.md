SridCloud
SridCloud
1 year ago
If you want VM name to have random suffix do this:

In main.tf, add this paragraph:

resource "random_string" "vm-name" {

  length = 6

  upper  = false

  number = false

  lower  = true

  special = false

}


and in libvirt_domain resource, set vm name as :

name   = "${var.VM_HOSTNAME}-${count.index}-${random_string.vm-name.result}"

Resulting vm will be :

# virsh list

 Id   Name          State

-----------------------------

 2    vm-0-qtyycq   running


