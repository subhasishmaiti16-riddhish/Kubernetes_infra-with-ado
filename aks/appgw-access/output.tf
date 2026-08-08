output "aks_principal_id" {
  value = {
    for k, v in data.azurerm_kubernetes_cluster.aks :
    k => v.identity[0].principal_id
  }
}
