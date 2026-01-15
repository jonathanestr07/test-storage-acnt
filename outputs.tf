output "storage_account_names" {
  description = "Names of all created storage accounts"
  value       = { for k, v in azurerm_storage_account.example : k => v.name }
}

output "storage_account_ids" {
  description = "IDs of all created storage accounts"
  value       = { for k, v in azurerm_storage_account.example : k => v.id }
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.example.name
}
