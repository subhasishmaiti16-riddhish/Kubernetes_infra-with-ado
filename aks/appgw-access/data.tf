data "azurerm_application_gateway" "appgw" {
  for_each            = var.access_new
  name                = each.value.appgw_name
  resource_group_name = each.value.rg_name
}


data "azurerm_resource_group" "rg" {
  for_each = var.access_new
  name     = each.value.rg_name
}

data "azurerm_kubernetes_cluster" "aks" {
  for_each = var.access_new

  name                = each.value.cluster_name
  resource_group_name = each.value.rg_name
}

data "azurerm_user_assigned_identity" "agic" {
  for_each = var.access_new

  name                = each.value.agic_identity_name
  resource_group_name = each.value.agic_rg_name
}

data "azurerm_subnet" "appgw_subnet" {
  for_each             = var.access_new
  name                 = each.value.sub_name  # আপনার actual subnet নাম বসান
  virtual_network_name = each.value.vnet_name # আপনার actual VNet নাম বসান
  resource_group_name  = data.azurerm_resource_group.rg[each.key].name
}
