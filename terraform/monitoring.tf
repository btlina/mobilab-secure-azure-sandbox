resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.prefix}-weu"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_monitor_action_group" "email" {
  name                = "ag-${var.prefix}-weu"
  resource_group_name = data.azurerm_resource_group.main.name
  short_name          = "sandbox"

  email_receiver {
    name          = "Lina"
    email_address = "lina@mobilabsolutions.com"
  }

  tags = var.tags
}