locals {
  common_tags = var.tags

  name_prefix = var.prefix

  cidr_plan = {
    vnet              = "10.30.0.0/16"
    workload          = "10.30.1.0/24"
    private_endpoints = "10.30.2.0/24"
    management        = "10.30.3.0/24"
  }
}