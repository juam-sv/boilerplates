# terraform {
#     backend "azurerm" {
#         resource_group_name  = "MyRgRemoteBackend"
#         storage_account_name  = "storageremotetf2"
#         container_name        = "tfbackends"
#         key                   = "terraform.tfstate"
#     }
# }