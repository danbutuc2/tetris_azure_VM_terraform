resource "azurerm_linux_virtual_machine" "dan-vm" {
  name                  = "dan-vm"
  resource_group_name   = azurerm_resource_group.dan-rg.name
  location              = azurerm_resource_group.dan-rg.location
  size                  = "Standard_B1ms"
  admin_username        = "dan"
  network_interface_ids = [azurerm_network_interface.dan-nic.id]

  custom_data = filebase64("docker-install.sh")
  disable_password_authentication = true

  admin_ssh_key {
    username   = "dan"
    public_key = file("~/.ssh/azure_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  tags = {
    environment = "Test"
  }
}