
provider "azurerm" {
  features {}
  subscription_id = "b8ad5888-e999-4f9a-9e93-5e885c47586f"
}

resource "azurerm_resource_group" "rg" {
  name     = "danResourceGroup"
  location = "westeurope"
}

resource "azurerm_storage_account" "storage" {
  name                     = "tfstatestoragedan"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate-container"
  storage_account_id  = azurerm_storage_account.storage.id
  container_access_type = "private"
}