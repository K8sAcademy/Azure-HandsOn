    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
        }
      }
      backend "azurerm" {
        resource_group_name  = "backendrg"
        storage_account_name = "backendsa[123]"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
      }
    }

    provider "azurerm" {
      features {}
    }