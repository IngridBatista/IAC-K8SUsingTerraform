terraform {
  required_providers {
     azurerm = {
      source = "hashicorp/azurerm"
      version = "2.52.0"
    }

    azuread = {
     source = "hashicorp/azuread"
      version = "1.4.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.0.3"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

provider "kubernetes" {
  host = azurerm_kubernetes_cluster.aks_cluster_teste.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks_cluster_teste.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks_cluster_teste.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks_cluster_teste.kube_config.0.cluster_ca_certificate)
  }