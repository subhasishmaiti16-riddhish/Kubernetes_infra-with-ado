resource "azurerm_resource_group" "rgs" {
  for_each = var.aks_new
  name     = each.value.rg_name
  location = each.value.location
}