## Kubernetes Deployment ##
resource "kubernetes_deployment" "wordpress_deployment" {
  metadata {
    name = "deployment-wordpress"
    labels = {
      App = "DeploymentWordpress"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "DeploymentWordpress"
      }
    }
    template {
      metadata {
        labels = {
          App = "DeploymentWordpress"
        }
      }
      spec {
        container {
          image = "wordpress"
          name  = "wordpress"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

## Kubernetes Service ##
resource "kubernetes_service" "wordpress_service" {
  
  metadata {
    name = "service-wordpress"
  }

  spec {
    selector = {
      App = kubernetes_deployment.wordpress_deployment.spec.0.template.0.metadata[0].labels.App
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"

  }
}