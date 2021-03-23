## Azure Application ##
resource "azuread_application" "app_k8s" {
  display_name = var.client_id
}

## Azure Service Principal ##
resource "azuread_service_principal" "service_principal_k8s" {
  application_id = azuread_application.app_k8s.application_id
}

## Azure Service Password ##
resource "azuread_service_principal_password" "service_principal_k8s_pass" {
  service_principal_id = azuread_service_principal.service_principal_k8s.id
  description          = "My managed password"
  value                = var.client_secret
  end_date             = "2099-01-01T01:02:03Z"
}