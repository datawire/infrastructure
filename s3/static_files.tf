// s3/statis_content.tf

resource "aws_s3_bucket" "static_files" {
  bucket = "datawire-static-files"
  acl    = "private"

  logging {
    target_bucket = "datawire-download-logs"
  }
}

resource "aws_s3_bucket_policy" "static_files" {
  bucket = "${aws_s3_bucket.static_files.id}"
  policy = "${file("${path.module}/static_files-policy.json")}"
}

resource "aws_s3_bucket" "wheelhouse" {
  bucket = "datawire-wheelhouse"
  acl    = "public-read"
}
