resource "azurerm_resource_group" "main" {

  name = var.resource_group

  location = var.location

}

module "acr" {

  source = "../../modules/acr"

  name = var.acr_name

  location = var.location

  resource_group_name = azurerm_resource_group.main.name

}

module "network" {

  source = "../../modules/network"

  name = "restauranty-vnet-lananh"

  location = var.location

  resource_group_name = azurerm_resource_group.main.name

}

module "gateway" {

  source = "../../modules/application_gateway"

  name = var.gateway_name

  location = var.location

  resource_group_name = azurerm_resource_group.main.name

  subnet_id = module.network.gateway_subnet_id

}

module "aks" {

  source = "../../modules/aks"

  name = var.aks_name

  location = var.location

  resource_group_name = azurerm_resource_group.main.name

  acr_id = module.acr.id

  gateway_id = module.gateway.id

  subnet_id = module.network.aks_subnet_id

}

module "key_vault" {
  source = "../../modules/key_vault"

  name = var.key_vault

  location = var.location

  resource_group_name = azurerm_resource_group.main.name
}