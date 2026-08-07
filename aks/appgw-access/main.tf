resource "azurerm_role_assignment" "appgw_contributor" {
  for_each = var.access_new
  scope                = data.azurerm_application_gateway.appgw[each.key].id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agic[each.key].principal_id
}

resource "azurerm_role_assignment" "rg_reader" {
  for_each = var.access_new
  scope                = data.azurerm_resource_group.rg[each.key].id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_user_assigned_identity.agic[each.key].principal_id
}

resource "azurerm_role_assignment" "appgw_subnet_join" {
  for_each              = var.access_new
  scope                 = data.azurerm_subnet.appgw_subnet[each.key].id
  role_definition_name  = "Network Contributor"
  principal_id          = data.azurerm_user_assigned_identity.agic[each.key].principal_id
}