output  "ip" {
  value = kubernetes_service.wordpress_service.status.0.load_balancer.0.ingress.0.ip
}