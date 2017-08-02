#!/usr/bin/env bash
set -euxo pipefail

terraform init -backend=true -get
terraform plan -out plan.out
terraform apply plan.out
