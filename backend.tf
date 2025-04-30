terraform {
  backend "azurerm" {
    resource_group_name   = "danResourceGroup" 
    storage_account_name  = "tfstatestoragedan"
    container_name        = "tfstate-container" 
    key                   = "terraform.tfstate"  
  }
}