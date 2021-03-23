variable location {
  default = "westus2"
}

variable resource_group_name {
  default = "aks_rg"
}

variable cluster_name {
  default = "aks_cluster"
}

variable "agent_count" {
  default = 1
}

variable "dns_prefix" {
  default = "aksdns"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "admin_username" {
    default = "k8s"
}

variable "client_id" {
    description = "Sete um nome para o Service Principle a ser criado"
}

variable "client_secret" {
    description = "Sete uma senha para o Service Principle a ser criado"
}