#!/usr/bin/env bash
set -euxo pipefail

KUBECTL_VERSION=${KUBECTL_VERSION:?"ERROR: KUBECTL_VERSION not set"}
KUBECTL_SHA256SUM=${KUBECTL_SHA256SUM:?"ERROR: KUBECTL_SHA256SUM not set"}

curl -L --output /tmp/kubectl \
     https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl

echo "${KUBECTL_SHA256SUM}  /tmp/kubectl" > /tmp/kubectl_SHA256
sha256sum -c /tmp/kubectl_SHA256

mv /tmp/kubectl ${TOOLS_DIR}/kubectl
chmod +x ${TOOLS_DIR}/kubectl
