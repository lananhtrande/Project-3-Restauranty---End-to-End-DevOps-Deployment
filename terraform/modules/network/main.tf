resource "azurerm_virtual_network" "this" {
  name                = var.name

  resource_group_name = var.resource_group_name

  location            = var.location

  address_space = [
    "10.0.0.0/8"
  ]
}

resource "azurerm_subnet" "aks" {
  name = "aks-subnet-lananh"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    "10.1.0.0/24"
  ]
}

resource "azurerm_subnet" "gateway" {
  name = "appgw-subnet-lananh"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = [
    "10.2.0.0/24"
  ]
}