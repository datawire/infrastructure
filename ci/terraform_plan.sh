#!/usr/bin/env bash
set -euxo pipefail

NOW=$(TZ=America/New_York date)
TRAVIS_PULL_REQUEST_BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:?"Variable TRAVIS_PULL_REQUEST_BRANCH not set"}

terraform init -backend=true -get

terraform plan -out plan.out
terraform show plan.out -no-color > plan.show
if [[ $? == "0" ]]; then
    git add plan.out
    git commit -m "terraform plan: $NOW [ci skip]"
fi

git push upstream ${TRAVIS_PULL_REQUEST_BRANCH}
