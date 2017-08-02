#!/usr/bin/env bash
set -euxo pipefail

terraform init -backend=true -get
terraform apply plan.out
