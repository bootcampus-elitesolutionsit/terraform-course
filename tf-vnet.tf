resource "azurerm_resource_group" "apprg5" {
  name     = "app-rg"
  location = "North Europe"
}

resource "azurerm_virtual_network" "network1" {
  name                = "app-network"
  location            = "North Europe"
  resource_group_name = "app-rg"
  address_space       = ["10.0.0.0/16"]
  

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    
  }

  tags = {
    name = "primary"
    environment = "dev"
  }
}