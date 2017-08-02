#!/usr/bin/env bash
set -euxo pipefail

terraform init -backend=true -get

terraform validate
terraform plan -out plan.out
terraform show plan.out -no-color > plan.show
