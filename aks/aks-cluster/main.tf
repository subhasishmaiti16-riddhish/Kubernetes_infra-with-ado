resource "azurerm_kubernetes_cluster" "aks_cluster" {
  for_each            = var.cluster_new
  name                = each.value.cluster_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = "aksdemo"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "Standard_D2ls_v5"
    vnet_subnet_id = data.azurerm_subnet.data_sub[each.key].id
  }

  identity {
    type = "SystemAssigned"
  }

  ingress_application_gateway {
    gateway_id = data.azurerm_application_gateway.appgw[each.key].id
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.240.0.0/16"
    dns_service_ip = "10.240.0.10"
  }
}
