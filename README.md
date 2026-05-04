# MobiLab Secure Azure Sandbox

## Overview

This project is a Terraform-based Azure sandbox platform designed for learning and DevOps practice.

It includes:

- Virtual Network
- Subnets
- Network Security Group
- Key Vault
- Private Endpoint
- Private DNS Zone
- Log Analytics Workspace
- Action Group
- Remote Terraform State
- GitHub Actions CI/CD simulation

## Architecture

```text
GitHub Repository
   ↓
GitHub Actions Pipeline
   ↓
Terraform Validation
   ↓
Plan Artifact
   ↓
Deploy Simulation
Resource Group
   ↓
Virtual Network 10.30.0.0/16
   ├── snet-workload 10.30.1.0/24
   ├── snet-private-endpoints 10.30.2.0/24
   └── snet-management 10.30.3.0/24

Key Vault
   ↓
Private Endpoint
   ↓
Private DNS Zone

Monitoring
   ↓
Log Analytics Workspace
   ↓
Action Group
Storage Account: tfstatelina001
Container: terraform
State Key: mobilab-secure-azure-sandbox.tfstate
# MobiLab Secure Azure Sandbox

## Features

- Terraform Infrastructure as Code
- Azure remote state
- VNet and subnet architecture
- NSG security rules
- Key Vault with Private Endpoint design
- Monitoring foundation
- GitHub Actions CI/CD simulation

## Current Status

CI/CD simulation: passing  
Remote backend: configured  
Real deployment from pipeline: blocked by RBAC permissions 
CI pipeline test
## CI/CD Pipeline

This project includes a GitHub Actions pipeline implementing a blue-green deployment strategy:

- Code push triggers automatic deployment
- Application is deployed to a staging slot (green)
- Health check is executed on the green slot
- Only healthy deployments are promoted to production

## Challenges Faced

- RBAC restriction when assigning AcrPull role
- App Service container deployment failure
- Pipeline authentication issues (missing publish profile)
- Health check failures due to misconfigured slot runtime

## Outcome

A fully automated, production-style deployment pipeline with validation and controlled rollout.