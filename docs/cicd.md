# CI/CD Simulation

This project includes a GitHub Actions pipeline that simulates the Azure DevOps pipeline flow.

## Build Stage

- Checks Terraform formatting
- Initializes Terraform without backend
- Validates Terraform
- Creates a simulated plan
- Archives the plan
- Uploads the artifact

## Deploy Stage

- Downloads artifact
- Extracts archive
- Simulates apply

## Why simulation?

Real deployment requires Azure authentication, a Service Principal or OIDC, and proper RBAC permissions.