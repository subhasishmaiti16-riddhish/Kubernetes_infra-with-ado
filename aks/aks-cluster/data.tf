data "azurerm_subnet" "data_sub" {
    for_each = var.cluster_new
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_application_gateway" "appgw" {
  for_each = var.cluster_new
  name                = each.value.appgw_name
  resource_group_name = each.value.rg_name
}