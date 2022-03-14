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

resource "azurerm_resource_group" "example" {
  name     = "aks-lab"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "aks-demo" {
  name                = "terraform-aks"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "terraformaks"

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_D2_v2"
    enable_auto_scaling = true
    max_count           = 3
    min_count           = 1
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  identity {
    type = "SystemAssigned"
  }

}
