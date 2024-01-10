terraform {
  required_version = "~>1.6.6"
  
  backend "azurerm" {
    resource_group_name  = "rg-k1x-devops-infrastructure-001"
    storage_account_name = "k1xtfstateinfra001"
    container_name       = "infrastructure-subscription-terraform"
    key                  = "jorge.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "test-rg" {
  name     = "rg-jorge24"
  location = "Central US"
}

output "rg_details" {
  value = azurerm_resource_group.test-rg
}
