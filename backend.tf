// file: backend.tf

terraform {
  backend "s3" {
    bucket         = "datawire-infrastructure"
    dynamodb_table = "datawire-infrastructure"
    encrypt        = true
    key            = "common.tf"
    region         = "us-east-1"
  }
}
