
resource "azurerm_resource_group" "dan-rg" {
  name     = "danResourceGroup"
  location = "westeurope"
  tags = {
    environment = "Test"
  }
}