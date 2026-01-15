terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-storage-loop-example"
  location = "East US"
}

# Deploy multiple storage accounts using for_each
resource "azurerm_storage_account" "example" {
  for_each = var.storage_accounts

  name                     = "staccount${each.key}123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.replication_type
}

# Create containers for each storage account using for_each
resource "azurerm_storage_container" "example" {
  for_each = var.storage_accounts

  name                  = "container-${each.key}"
  storage_account_id    = azurerm_storage_account.example[each.key].id
  container_access_type = "blob"
}