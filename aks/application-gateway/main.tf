resource "azurerm_application_gateway" "appgw" {
  for_each            = var.appgw_new
  name                = each.value.appgw_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  sku {
  name = "Standard_v2"
  tier = "Standard_v2"
}
autoscale_configuration {
  min_capacity = 1
  max_capacity = 3
}
  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = data.azurerm_subnet.data_sub[each.key].id
  }

  frontend_port {
    name = "http"
    port = 80
  }
  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  backend_http_settings {
    name                  = "http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }
  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }
  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "http-setting"
    priority                   = 100
  }

}
