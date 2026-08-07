data "azurerm_subnet" "data_sub" {
    for_each = var.appgw_new
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
data "azurerm_public_ip" "data_pip" {
  for_each = var.appgw_new
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
