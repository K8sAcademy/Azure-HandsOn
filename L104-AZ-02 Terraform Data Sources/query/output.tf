output "data_center" {
  value = data.azurerm_kubernetes_cluster.example.location
}

output "k8s_version" {
  value = data.azurerm_kubernetes_cluster.example.kubernetes_version
}

output "default_pool_node_count" {
  value = data.azurerm_kubernetes_cluster.example.agent_pool_profile[0].count
}