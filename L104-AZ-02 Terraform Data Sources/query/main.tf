terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.96.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "example" {
  name                = "terraform-aks"
  resource_group_name = "aks-lab"
}


