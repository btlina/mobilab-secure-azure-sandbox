#!/usr/bin/env bash
set -euo pipefail

cd terraform

terraform fmt -recursive
terraform init -backend=false
terraform validate