#!/usr/bin/env bash
set -euxo pipefail

TOOLS_DIR=${TOOLS_DIR:?"ERROR: TOOLS_DIR not set"}

mkdir -p ${TOOLS_DIR}

#mkdir -p ${HOME}/.aws
#openssl aes-256-cbc \
#    -K $encrypted_59987e22508c_key \
#    -iv $encrypted_59987e22508c_iv \
#    -in ci/aws_credentials.enc \
#    -out ${HOME}/.aws/credentials \
#    -d
