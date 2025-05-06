resource "azurerm_storage_account" "tfstate-storage" {
  name                     = "tfstatestoragedan"
  resource_group_name      = azurerm_resource_group.dan-rg.name
  location                 = azurerm_resource_group.dan-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "Test"
  }
}

resource "azurerm_storage_container" "tfstate-container" {
  name                  = "tfstate-container"
  storage_account_id    = azurerm_storage_account.tfstate-storage.id
  container_access_type = "private"
}



resource "azurerm_storage_blob" "tfstate-blob" {
  name                   = "terraform.tfstate"
  storage_account_name   = azurerm_storage_account.tfstate-storage.name
  storage_container_name = azurerm_storage_container.tfstate-container.name
  type                   = "Block"
  source                 = "terraform.tfstate"
}
