#!/usr/bin/env bash
set -euo pipefail

# Script needs AWS credentials to talk to the S3 kops state store backend
ln -sf ~/.aws "$(pwd)/.aws"
export HOME="$(pwd)"
export KOPS_STATE_STORE="s3://datawire-kops-state"

kops export kubecfg --name "$1"
rm -rf "$HOME/.aws"

cp "$HOME/.kube/config" "$1.kubeconfig"
rm -rf "$HOME/.kube"
