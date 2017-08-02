#!/usr/bin/env bash
set -euxo pipefail

GH_USERNAME=${GH_USERNAME:?"Variable GH_USERNAME is not set"}
GH_TOKEN=${GH_TOKEN:?"Variable GH_TOKEN is not set"}
GH_REPO=${GH_REPO:?"Variable GH_REPO is not set"}
GH_USER_EMAIL=${GH_USER_EMAIL:?"Variable GH_USER_EMAIL is not set"}

TRAVIS_BRANCH=${TRAVIS_BRANCH:?"Variable TRAVIS_BRANCH is not set"}

set +x
git remote add upstream "https://$GH_TOKEN@github.com/$GH_REPO.git"
set -x

git config user.name  ${GH_USERNAME}
git config user.email ${GH_USER_EMAIL}

if [[ "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
    git fetch origin ${TRAVIS_PULL_REQUEST_BRANCH}:${TRAVIS_PULL_REQUEST_BRANCH}
    git checkout ${TRAVIS_PULL_REQUEST_BRANCH}
elif [[ "$TRAVIS_BRANCH" == "master" ]]; then
    git checkout master
fi
