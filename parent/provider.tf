terraform {
  required_version = ">= 1.6.0"
  backend "azurerm" {
    resource_group_name  = "state-file-rg"
    storage_account_name = "statefileaccountfork8s"
    container_name       = "statefilestorage"
    key                  = "preprod.statefilestorage"

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
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
