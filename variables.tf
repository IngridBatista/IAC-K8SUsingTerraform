## Azure config variables ##
variable location {
  default = "Central US"
}

## Resource group variables ##
variable resource_group_name {
  default = "aks_rg_teste"
}


## AKS kubernetes cluster variables ##
variable cluster_name {
  default = "aks_cluster_teste"
}

variable "agent_count" {
  default = 1
}

variable "dns_prefix" {
  default = "aksdemo"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "admin_username" {
    default = "demo"
}

variable "client_id" {
    description = "Deve setar o nome da app"
}

variable "client_secret" {
    description = "Deve definir a senha da app"
}