resource "azurerm_resource_group" "core" {
  name     = "azdep-${var.environment}-${var.suffix}"
  location = var.location
}

resource "azurerm_storage_account" "core" {
  name                              = "azdep${var.environment}${var.suffix}"
  resource_group_name               = azurerm_resource_group.core.name
  location                          = azurerm_resource_group.core.location
  account_tier                      = "Standard"
  account_replication_type          = "GRS"
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
}

// azurerm storage container
resource "azurerm_storage_container" "core" {
  name                  = "core"
  storage_account_name  = azurerm_storage_account.core.name
  container_access_type = "private"
}

resource "azurerm_cognitive_account" "openai" {
  name                = "azdep-openai-${var.environment}${var.suffix}"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  kind                = "OpenAI"
  sku_name            = "S0"
}