# Azure DevOps Starter

A small, secure-by-default Azure infrastructure starter using Terraform and GitHub Actions.

## What it creates

- Azure resource group
- Azure Storage Account with TLS 1.2 and blob versioning
- Consistent project and environment tags

## Local usage

1. Install Terraform 1.6+ and authenticate with Azure CLI:

   ```bash
   az login
   ```

2. Copy the example variables file and set your subscription ID:

   ```bash
   cp infra/terraform.tfvars.example infra/terraform.tfvars
   ```

3. Initialize and review the plan:

   ```bash
   terraform -chdir=infra init
   terraform -chdir=infra plan
   ```

4. Apply only after reviewing the plan:

   ```bash
   terraform -chdir=infra apply
   ```

## GitHub Actions

The workflow runs Terraform formatting and validation on pushes and pull requests. Pull requests also run a plan using the `AZURE_SUBSCRIPTION_ID` repository secret. This starter intentionally does not auto-apply infrastructure; add federated Azure authentication and a protected deployment environment before enabling applies.

## Security notes

- Never commit `terraform.tfvars`, state files, or credentials.
- Prefer GitHub OIDC / Azure federated credentials over long-lived service-principal secrets for deployments.
- Configure remote Terraform state with locking before using this beyond a demo.
