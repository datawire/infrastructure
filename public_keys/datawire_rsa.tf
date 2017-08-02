// file: datawire_rsa.tf

resource "aws_key_pair" "datawire_rsa" {
  key_name   = "datawire_rsa"
  public_key = "${file("${path.module}/datawire_rsa.pub")}"
}

output "datawire_rsa_public_key_path" {
  value = "${pathexpand("${path.module}/datawire_rsa.pub")}"
}
