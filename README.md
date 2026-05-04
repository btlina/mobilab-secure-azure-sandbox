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