# ----------- Basic Variables -----------
variable "location" {
  description ="Location For The Resource"
  default ="West Europe"
}

variable "name" {
  description ="Name For The Resource"
  default ="azure_Lab"
}


# ----------- Network Variables -----------
variable "vnet_name" {
  description ="Name For The Virtual Network"
  default = "${var.name}-vnet"
}

variable "vnet_address_space" {
  description ="Address Space For The Virtual Network"
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description ="Name For The Subnet"
  default = "${var.name}-subnet"
}

variable "subnet_range" {
  description ="Range For The Subnet"
  default = ["10.0.10.0/24"]
}

variable "net_interface" {
  description ="Name For The Network Interface"
  default = "${var.name}-nic"
}

# ----------- VM Variables -----------
variable "vm_name" {
  description ="Name For The Virtual Machine"
  default = "${var.name}-vm"
}

variable "flavor" {
  description ="Flavor For The Virtual Machine"
  default = "Standard_DS1_v2"
}