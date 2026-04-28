# Architecture

The sandbox uses a segmented Azure network.

## CIDR Plan

```text
VNet: 10.30.0.0/16

snet-workload:          10.30.1.0/24
snet-private-endpoints: 10.30.2.0/24
snet-management:        10.30.3.0/24