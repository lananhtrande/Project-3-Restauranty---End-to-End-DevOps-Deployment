resource "azurerm_public_ip" "this" {
  name                = "${var.name}-ip"
  resource_group_name = var.resource_group_name
  location            = var.location

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {

    name = "gateway-la"

    subnet_id = var.subnet_id

  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.this.id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  backend_address_pool {
    name = "backend-pool"
  }

  backend_http_settings {
    name                  = "backend-http"
    cookie_based_affinity = "Disabled"

    protocol = "Http"
    port     = 80

    request_timeout = 60
  }

  http_listener {
    name = "listener"

    frontend_ip_configuration_name = "frontend-ip"

    frontend_port_name = "frontend-port"

    protocol = "Http"
  }

  request_routing_rule {
    name      = "routing-rule"
    priority  = 1
    rule_type = "Basic"

    http_listener_name = "listener"

    backend_address_pool_name = "backend-pool"

    backend_http_settings_name = "backend-http"
  }
}