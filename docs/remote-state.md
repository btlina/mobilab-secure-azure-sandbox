# Remote State

Terraform state stores the mapping between Terraform code and real Azure resources.

Instead of storing state locally, this project stores it in Azure Blob Storage.

## Backend

```hcl
backend "azurerm" {
  resource_group_name  = "rg-lina-playground"
  storage_account_name = "tfstatelina001"
  container_name       = "terraform"
  key                  = "mobilab-secure-azure-sandbox.tfstate"
}