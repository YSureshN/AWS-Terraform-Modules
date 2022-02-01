output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.my_aks.*.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.my_aks.*.name
}
