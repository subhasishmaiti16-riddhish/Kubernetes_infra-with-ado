terraform {
  required_version = ">= 1.6.0"
  backend "azurerm" {
    resource_group_name  = "rg_provider"
    storage_account_name = "datablockstorage2"
    container_name       = "datablockcont"
    key                  = "parent.datablockcont"

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
}
provider "azurerm" {
  features {}

}
