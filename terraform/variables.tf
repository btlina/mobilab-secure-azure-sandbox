variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Existing resource group used for the sandbox"
  type        = string
  default     = "rg-lina-playground"
}

variable "prefix" {
  description = "Project prefix"
  type        = string
  default     = "mobilab-sandbox"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)

  default = {
    OwnerEmail   = "lina@mobilabsolutions.com"
    Environment  = "lab"
    Project      = "mobilab-secure-azure-sandbox"
    CreationDate = "2026-04-24T10:00:00.0000000Z"
    DeletionDate = "2026-05-01T10:00:00.0000000Z"
  }
}