provider "azurerm" {
    subscription_id = ""
    client_id       = ""
    client_secret   = ""
    tenant_id       = ""
}
resource "azurerm_resource_group" "aci-rg" {
  name     = "RGDemoBanco"
  location = "westus"
}

resource "azurerm_container_group" "aci-mibanco" {
  name                = "aci-mibanco"
  location            = "${azurerm_resource_group.aci-rg.location}"
  resource_group_name = "${azurerm_resource_group.aci-rg.name}"
  ip_address_type     = "public"
  os_type             = "linux"

  container {
    name   = "nginx"
    image  = "nginx"
    cpu    = "2"
    memory = "3.5"
    port   = "80"

    environment_variables {
      "NODE_ENV" = "Staging"
    }
  }

  tags {
    environment = "testing"
  }
} 
