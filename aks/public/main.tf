resource "azurerm_public_ip" "pip_new" {
  for_each            = var.public_new
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku

}