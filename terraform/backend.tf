terraform {
  backend "azurerm" {
    resource_group_name  = "rg-lina-playground"
    storage_account_name = "tfstatelina001"
    container_name       = "terraform"
    key                  = "mobilab-secure-azure-sandbox.tfstate"
  }
}