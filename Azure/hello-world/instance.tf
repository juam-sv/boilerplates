# resource "azurerm_storage_account" "stor" {
#   name                     = "madrabookstor"
#   location                 = var.location
#   resource_group_name      = azurerm_resource_group.rg.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = var.location
  vm_size               = var.flavor
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username        = var.username

  admin_ssh_key {
    username = var.username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-os_disk"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    # create_option     = "FromImage"
  }

  # os_profile {
  #   computer_name  = "MadraPC"
  #   admin_password = var.user_pass
  # }

  os_profile_linux_config {
    disable_password_authentication = true
  }

  # boot_diagnostics {
  #   enabled     = true
  #   storage_uri = azurerm_storage_account.stor.primary_blob_endpoint
  # }
}