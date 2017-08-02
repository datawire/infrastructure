// file: kops.tf
//
// infrastructure requirements for Kubernetes Ops "kops" to function.
//

resource "aws_s3_bucket" "kops_state_store" {
  acl    = "private"
  bucket = "datawire-kops-state"

  versioning {
    enabled = true
  }
}
