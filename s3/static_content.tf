// s3/statis_content.tf

resource "aws_s3_bucket" "static_content" {
  bucket = "datawire-static-content"
  acl    = "private"
}
