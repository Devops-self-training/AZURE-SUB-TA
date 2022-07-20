# Provider configuration
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  tenant_id       = local.tenant_id
  subscription_id = local.subscription_id
  features {
    
  }
}

# Backend configuration
# Replace these values to your own
terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstate4445"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}