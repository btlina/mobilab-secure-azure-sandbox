# Architecture

## Network Design

VNet: 10.30.0.0/16

Subnets:

| Subnet | CIDR | Purpose |
|---|---|---|
| snet-workload | 10.30.1.0/24 | Application workloads |
| snet-private-endpoints | 10.30.2.0/24 | Private endpoints |
| snet-management | 10.30.3.0/24 | Admin and future tooling |

## Security

- NSG attached to workload subnet
- HTTPS allowed
- All other inbound traffic denied
- Key Vault planned with Private Endpoint

## Monitoring

- Log Analytics Workspace
- Action Group
- Future alerts for CPU, memory, and availability