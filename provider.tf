terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-poc"
    storage_account_name = "sapocbackend"
    container_name       = "conpoc"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  
}