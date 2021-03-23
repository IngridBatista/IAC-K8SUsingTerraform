#output "id" {
#    value = azurerm_kubernetes_cluster.aks_demo.id
#}

#output "client_key" {
#  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.client_key
#}

#output "client_certificate" {
#  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.client_certificate
#}

#output "cluster_ca_certificate" {
#  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.cluster_ca_certificate
#}

#output "kube_config" {
#  value = azurerm_kubernetes_cluster.aks_demo.kube_config_raw
#}

#output "host" {
#  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.host
#}

output  "ip" {
  value = kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.ip
}