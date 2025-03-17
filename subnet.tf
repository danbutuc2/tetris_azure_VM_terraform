resource "azurerm_subnet" "dan-subnet" {
  name                 = "dan-subnet"
  resource_group_name  = azurerm_resource_group.dan-rg.name
  virtual_network_name = azurerm_virtual_network.dan-network.name
  address_prefixes     = ["10.123.1.0/24"]
}