resource "azurerm_public_ip" "dan-public-ip" {
  name                = "dan-public-ip"
  location            = azurerm_resource_group.dan-rg.location
  resource_group_name = azurerm_resource_group.dan-rg.name

  allocation_method = "Static"

  tags = {
    environment = "Test"
  }
}

resource "azurerm_network_interface" "dan-nic" {
  name                = "dan-nic"
  location            = azurerm_resource_group.dan-rg.location
  resource_group_name = azurerm_resource_group.dan-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.dan-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dan-public-ip.id
  }

  tags = {
    environment = "Test"
  }
}