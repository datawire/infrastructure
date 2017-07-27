// file: datawire_rsa.tf

resource "aws_key_pair" "kubernaut" {
  key_name   = "datawire_rsa"
  public_key = "${file("${path.module}/datawire_rsa.pub")}"
}
