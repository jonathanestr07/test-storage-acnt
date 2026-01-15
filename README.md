# Azure Storage Account Deployment with Terraform

This Terraform configuration deploys multiple Azure Storage Accounts across different environments using the `for_each` loop pattern.

## Features

- Deploys storage accounts for dev, staging, and prod environments
- Creates storage containers for each account
- Uses configuration-driven approach with variables
- Outputs storage account names and IDs

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Azure subscription
- Azure CLI installed and authenticated

## Usage

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Authenticate to Azure**
   ```bash
   az login
   ```

3. **Review the execution plan**
   ```bash
   terraform plan
   ```

4. **Apply the configuration**
   ```bash
   terraform apply
   ```

5. **Destroy resources when done**
   ```bash
   terraform destroy
   ```

## Configuration

Modify the `variables.tf` file to customize storage account configurations for each environment:

- `location`: Azure region for deployment
- `account_tier`: Standard or Premium
- `replication_type`: LRS, GRS, or ZRS

## Resources Created

- 1 Resource Group
- 3 Storage Accounts (dev, staging, prod)
- 3 Storage Containers (one per storage account)

## Outputs

- `storage_account_names`: Map of environment names to storage account names
- `storage_account_ids`: Map of environment names to storage account IDs
- `resource_group_name`: Name of the created resource group

## License

MIT
