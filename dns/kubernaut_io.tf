// file: kubernaut.io

data "aws_elb_hosted_zone_id" "main" {}

resource "aws_route53_record" "kubernaut_io" {
  name    = "kubernaut.io"
  zone_id = "${lookup(var.hosted_zone_ids, "kubernaut.io")}"
  type    = "A"

  alias {
    evaluate_target_health = true
    name                   = "${var.kubernaut_load_balancer_id}"
    zone_id                = "${data.aws_elb_hosted_zone_id.main.id}"
  }
}