terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  cloud {
    organization = ""

    workspaces {
      name = ""
    }
  }
}

provider "azurerm" {
  features {}
  /*
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
*/
}

/*
resource "azurerm_resource_group" "labrg" {
  name     = var.resourcegroup_name
  location = var.region
  tags = {
    environment = var.project_name
  }
}
*/