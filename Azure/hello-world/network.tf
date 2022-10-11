resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
}

resource "azurerm_subnet" "subnet_private" {
  name                 = "${var.prefix}-subnet-private"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg_main.name
  address_prefixes     = var.subnet_range
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name

  ip_configuration {
    name                          = "${var.prefix}-internal"
    subnet_id                     = azurerm_subnet.subnet_private.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.prefix}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_main.name
  allocation_method   = "Dynamic"
  domain_name_label   = var.pip_domain
}