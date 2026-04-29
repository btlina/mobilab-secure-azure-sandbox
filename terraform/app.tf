resource "azurerm_service_plan" "main" {
  name                = "asp-${var.prefix}-weu"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  os_type  = "Linux"
  sku_name = "S1"

  tags = var.tags
}

resource "azurerm_linux_web_app" "main" {
  name                = "app-${var.prefix}-${random_string.kv_suffix.result}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  tags = var.tags
}
resource "azurerm_linux_web_app_slot" "green" {
  name           = "green"
  app_service_id = azurerm_linux_web_app.main.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  tags = var.tags
}