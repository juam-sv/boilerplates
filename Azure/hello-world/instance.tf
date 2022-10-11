# resource "azurerm_storage_account" "stor" {
#   name                     = "madrabookstor"
#   location                 = var.location
#   resource_group_name      = azurerm_resource_group.rg.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_linux_virtual_machine" "vm_linux" {
  name                  = "${var.prefix}-vm"
  size               = var.flavor
  location              = azurerm_resource_group.rg_main.location
  resource_group_name   = azurerm_resource_group.rg_main.name
  admin_username        = var.username
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username = var.username
    public_key = file("~/.ssh/azure.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "${var.prefix}-os_disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  # os_profile {
  #   computer_name  = "MadraPC"
  #   admin_password = var.user_pass
  # }

  # os_profile_linux_config {
  #   disable_password_authentication = true
  # }

  # boot_diagnostics {
  #   enabled     = true
  #   storage_uri = azurerm_storage_account.stor.primary_blob_endpoint
  # }
}