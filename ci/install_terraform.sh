#!/usr/bin/env bash
set -euxo pipefail

TOOLS_DIR=${TOOLS_DIR:?"ERROR: TOOLS_DIR not set"}
TERRAFORM_VERSION=${TERRAFORM_VERSION:?"ERROR: TERRAFORM_VERSION not set"}
TERRAFORM_SHA256SUM=${TERRAFORM_SHA256SUM:?"ERROR: TERRAFORM_SHA256SUM not set"}

curl -L --output /tmp/terraform-${TERRAFORM_VERSION}.zip \
     https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

echo "${TERRAFORM_SHA256SUM}  /tmp/terraform-${TERRAFORM_VERSION}.zip" > /tmp/terraform_SHA256
sha256sum -c /tmp/terraform_SHA256

unzip /tmp/terraform-${TERRAFORM_VERSION}.zip
mv terraform ${TOOLS_DIR}/terraform
chmod +x ${TOOLS_DIR}/terraform

terraform version
