variable "storage_accounts" {
  description = "Map of storage accounts to create with their configurations"
  type = map(object({
    location         = string
    account_tier     = string
    replication_type = string
  }))
  default = {
    "dev" = {
      location         = "East US"
      account_tier     = "Standard"
      replication_type = "LRS"
    }
    "staging" = {
      location         = "West US"
      account_tier     = "Standard"
      replication_type = "GRS"
    }
    "prod" = {
      location         = "Central US"
      account_tier     = "Premium"
      replication_type = "ZRS"
    }
  }
}
