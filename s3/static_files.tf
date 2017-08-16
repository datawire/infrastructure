// s3/statis_content.tf

resource "aws_s3_bucket" "static_files" {
  bucket = "datawire-static-files"
  acl    = "private"
}
