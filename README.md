# Datawire Infrastructure

[![Build Status](https://travis-ci.org/datawire/infrastructure.svg?branch=master)](https://travis-ci.org/datawire/infrastructure)

[![Join the chat at https://gitter.im/datawire/infrastructure](https://badges.gitter.im/datawire/infrastructure.svg)](https://gitter.im/datawire/infrastructure?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Core / common infrastructure definition and automation for Datawire's backend.

We are redoing this in the near future to be simpler and easier...

# Cluster Management

1. Create a branch for whatever work you're going to perform.
2. `export KOPS_STATE_STORE s3://datawire-kops-state`
3. `export CLUSTER_NAME=prod` or `export CLUSTER_NAME=dev`

## Increase worker nodes

1. Open `kubernetes_clusters/$CLUSTER_NAME/kops/clusters.yaml`
2. Find the `nodes` InstanceGroup at the bottom of the file.
3. Change `minSize` and `maxSize` as desired.
4. Run `kops replace -f kubernetes_clusters/$CLUSTER_NAME/kops/clusters.yaml`
5. Run `kops update --name=${CLUSTER_NAME}.k736.net --target terraform --out kubernetes_clusters/dev/`
6. Commit changes and open a PR against `master`

## Emergency skip CI

1. After `kops update ...` run `ci/terraform_plan.sh`.
2. Verify the plan does what you expect (ask Phil if you're unsure).
3. Run `ci/terraform_apply.sh`.
4. Commit changes back to `master`.

# License

Licensed under Apache 2.0. Please read [LICENSE](LICENSE) for details.
