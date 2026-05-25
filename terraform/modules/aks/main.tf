resource "azurerm_kubernetes_cluster" "this" {

  name = var.name

  location = var.location

  resource_group_name = var.resource_group_name

  dns_prefix = "restauranty"

  default_node_pool {

    name = "system"

    node_count = 5

    vm_size = "Standard_D4pds_v5"

    vnet_subnet_id = var.subnet_id

  }

  identity {

    type = "SystemAssigned"

  }

  ingress_application_gateway {

    gateway_id = var.gateway_id

  }

}

resource "azurerm_role_assignment" "acr" {

  scope = var.acr_id

  role_definition_name = "AcrPull"

  principal_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

}