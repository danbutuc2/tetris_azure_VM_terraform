resource "azurerm_virtual_network" "dan-network" {
  name                = "dan-network"
  resource_group_name = azurerm_resource_group.dan-rg.name
  location            = azurerm_resource_group.dan-rg.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = "Test"
  }
}