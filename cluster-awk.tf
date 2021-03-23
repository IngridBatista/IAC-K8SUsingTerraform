## Azure resource group for the kubernetes cluster ##
resource "azurerm_resource_group" "aks_rg_teste" {
  name     = var.resource_group_name
  location = var.location
}

## AKS kubernetes cluster ##
resource "azurerm_kubernetes_cluster" "aks_cluster_teste" { 
  name                = var.cluster_name
  resource_group_name = azurerm_resource_group.aks_rg_teste.name
  location            = azurerm_resource_group.aks_rg_teste.location
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = var.admin_username

    # SSH key is generated using "tls_private_key" resource
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name       = "default"
    node_count = var.agent_count
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = azuread_service_principal.example.application_id
    client_secret = azuread_service_principal_password.example.value
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }


  tags = {
    environment = "Test"
  }
}