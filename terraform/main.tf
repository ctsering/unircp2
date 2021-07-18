# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# crea un service principal y rellena los siguientes datos para autenticar
provider "azurerm" {
  features {}
  subscription_id = "a0c5f366-d3df-4c90-a3a8-431d022aea19"
  client_id       = "56dba2be-ee67-4b58-8217-81f81375fb38"
  client_secret   = "FTRkla8q8hAGEK8KOKaEnDdEmsq.2vyy_b"
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
    name     =  "kubernetes_rg"
    location = var.location

    tags = {
        environment = "unircp2"
    }

}

# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "stAccount" {
    name                     = "staccountcp2" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "unircp2"
    }

}
