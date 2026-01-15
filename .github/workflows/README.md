# GitHub Actions Workflow Setup

## Prerequisites

You need to create a **Service Principal** in Azure and add its credentials as GitHub Secrets.

## Step 1: Create Azure Service Principal

Run this command in Azure CLI:

```bash
az ad sp create-for-rbac --name "github-terraform-sp" \
  --role "Contributor" \
  --scopes /subscriptions/<YOUR_SUBSCRIPTION_ID> \
  --sdk-auth
```

This will output JSON with the credentials you need.

## Step 2: Add GitHub Secrets

Go to your GitHub repository → Settings → Secrets and variables → Actions → New repository secret

Add these 4 secrets:

1. **AZURE_CLIENT_ID** - The `clientId` from the JSON output
2. **AZURE_CLIENT_SECRET** - The `clientSecret` from the JSON output  
3. **AZURE_SUBSCRIPTION_ID** - The `subscriptionId` from the JSON output
4. **AZURE_TENANT_ID** - The `tenantId` from the JSON output

## Step 3: How the Workflow Works

### Triggers:
- **Push to main branch** - Runs plan and apply
- **Pull request to main** - Runs plan only (no apply)
- **Manual trigger** - Can run via "Actions" tab in GitHub

### Steps:
1. Checkout code
2. Setup Terraform
3. Format check (validation)
4. Initialize Terraform
5. Validate configuration
6. Run terraform plan
7. Apply changes (only on main branch push)
8. Show outputs

### Workflow Behavior:
- **Pull Requests**: Only runs `terraform plan` to show what would change
- **Push to main**: Runs `terraform apply` to actually deploy resources
- **Manual**: Can be triggered from GitHub Actions tab

## Security Notes

- Never commit the service principal credentials to your repository
- Store all credentials as GitHub Secrets
- Consider using Azure OIDC for passwordless authentication (more secure)
- Review the Service Principal's permissions regularly

## Optional: Switch to OIDC (Recommended)

For better security, you can use OpenID Connect (OIDC) instead of client secrets. This eliminates the need to store long-lived credentials.

[Learn more about OIDC with Azure](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-azure)
