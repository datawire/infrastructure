// file: outputs.tf

output "kops_state_store" {
  value = "${aws_s3_bucket.kops_state_store.bucket}"
}
