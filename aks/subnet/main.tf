resource "azurerm_subnet" "aks_subnet" {
  for_each             = var.sub_new
  name                 = each.value.sub_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

# resource "azurerm_subnet" "appgw" {
#   name                 = "appgw-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }