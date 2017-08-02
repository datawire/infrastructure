#!/usr/bin/env bash
set -euxo pipefail

KOPS_VERSION=${KOPS_VERSION:?"ERROR: KOPS_VERSION not set"}
KOPS_SHA256SUM=${KOPS_SHA256SUM:?"ERROR: KOPS_SHA256SUM not set"}

curl -L --output /tmp/kops \
     https://github.com/kubernetes/kops/releases/download/1.6.2/kops-linux-amd64

echo "${KOPS_SHA256SUM}  /tmp/kops" > /tmp/kops_SHA256
sha256sum -c /tmp/kops_SHA256

mv /tmp/kops ${TOOLS_DIR}/kops
chmod +x ${TOOLS_DIR}/kops
