output "cluster_name" {
  value = "prod.k736.net"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-prod-k736-net.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-prod-k736-net.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-prod-k736-net.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-prod-k736-net.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-east-1a-prod-k736-net.id}", "${aws_subnet.us-east-1b-prod-k736-net.id}", "${aws_subnet.us-east-1c-prod-k736-net.id}", "${aws_subnet.us-east-1d-prod-k736-net.id}", "${aws_subnet.us-east-1e-prod-k736-net.id}", "${aws_subnet.us-east-1f-prod-k736-net.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-prod-k736-net.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-prod-k736-net.name}"
}

output "region" {
  value = "us-east-1"
}

output "vpc_id" {
  value = "${aws_vpc.prod-k736-net.id}"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_attachment" "master-us-east-1a-masters-prod-k736-net" {
  elb                    = "${aws_elb.api-prod-k736-net.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1a-masters-prod-k736-net.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1b-masters-prod-k736-net" {
  elb                    = "${aws_elb.api-prod-k736-net.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1b-masters-prod-k736-net.id}"
}

resource "aws_autoscaling_attachment" "master-us-east-1c-masters-prod-k736-net" {
  elb                    = "${aws_elb.api-prod-k736-net.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-east-1c-masters-prod-k736-net.id}"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-prod-k736-net" {
  name                 = "master-us-east-1a.masters.prod.k736.net"
  launch_configuration = "${aws_launch_configuration.master-us-east-1a-masters-prod-k736-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-prod-k736-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1a.masters.prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "datawire.io/environment"
    value               = "prod"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-us-east-1b-masters-prod-k736-net" {
  name                 = "master-us-east-1b.masters.prod.k736.net"
  launch_configuration = "${aws_launch_configuration.master-us-east-1b-masters-prod-k736-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1b-prod-k736-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1b.masters.prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "datawire.io/environment"
    value               = "prod"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-us-east-1c-masters-prod-k736-net" {
  name                 = "master-us-east-1c.masters.prod.k736.net"
  launch_configuration = "${aws_launch_configuration.master-us-east-1c-masters-prod-k736-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1c-prod-k736-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1c.masters.prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "datawire.io/environment"
    value               = "prod"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-prod-k736-net" {
  name                 = "nodes.prod.k736.net"
  launch_configuration = "${aws_launch_configuration.nodes-prod-k736-net.id}"
  max_size             = 6
  min_size             = 6
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-prod-k736-net.id}", "${aws_subnet.us-east-1b-prod-k736-net.id}", "${aws_subnet.us-east-1c-prod-k736-net.id}", "${aws_subnet.us-east-1d-prod-k736-net.id}", "${aws_subnet.us-east-1e-prod-k736-net.id}", "${aws_subnet.us-east-1f-prod-k736-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.prod.k736.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "datawire.io/environment"
    value               = "prod"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-prod-k736-net" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "a.etcd-events.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/events"      = "a/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-prod-k736-net" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "a.etcd-main.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/main"        = "a/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-events-prod-k736-net" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "b.etcd-events.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/events"      = "b/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-main-prod-k736-net" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "b.etcd-main.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/main"        = "b/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-events-prod-k736-net" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "c.etcd-events.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/events"      = "c/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-main-prod-k736-net" {
  availability_zone = "us-east-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster         = "prod.k736.net"
    Name                      = "c.etcd-main.prod.k736.net"
    "datawire.io/environment" = "prod"
    "k8s.io/etcd/main"        = "c/a,b,c"
    "k8s.io/role/master"      = "1"
  }
}

resource "aws_elb" "api-prod-k736-net" {
  name = "api-prod-k736-net-97iv17"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-prod-k736-net.id}"]
  subnets         = ["${aws_subnet.us-east-1a-prod-k736-net.id}", "${aws_subnet.us-east-1b-prod-k736-net.id}", "${aws_subnet.us-east-1c-prod-k736-net.id}", "${aws_subnet.us-east-1d-prod-k736-net.id}", "${aws_subnet.us-east-1e-prod-k736-net.id}", "${aws_subnet.us-east-1f-prod-k736-net.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "api.prod.k736.net"
  }
}

resource "aws_iam_instance_profile" "masters-prod-k736-net" {
  name = "masters.prod.k736.net"
  role = "${aws_iam_role.masters-prod-k736-net.name}"
}

resource "aws_iam_instance_profile" "nodes-prod-k736-net" {
  name = "nodes.prod.k736.net"
  role = "${aws_iam_role.nodes-prod-k736-net.name}"
}

resource "aws_iam_role" "masters-prod-k736-net" {
  name               = "masters.prod.k736.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.prod.k736.net_policy")}"
}

resource "aws_iam_role" "nodes-prod-k736-net" {
  name               = "nodes.prod.k736.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.prod.k736.net_policy")}"
}

resource "aws_iam_role_policy" "masters-prod-k736-net" {
  name   = "masters.prod.k736.net"
  role   = "${aws_iam_role.masters-prod-k736-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.prod.k736.net_policy")}"
}

resource "aws_iam_role_policy" "nodes-prod-k736-net" {
  name   = "nodes.prod.k736.net"
  role   = "${aws_iam_role.nodes-prod-k736-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.prod.k736.net_policy")}"
}

resource "aws_internet_gateway" "prod-k736-net" {
  vpc_id = "${aws_vpc.prod-k736-net.id}"

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "prod.k736.net"
  }
}

resource "aws_key_pair" "kubernetes-prod-k736-net-b4229c4c06c35abb9923878e1d485e13" {
  key_name   = "kubernetes.prod.k736.net-b4:22:9c:4c:06:c3:5a:bb:99:23:87:8e:1d:48:5e:13"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.prod.k736.net-b4229c4c06c35abb9923878e1d485e13_public_key")}"
}

resource "aws_launch_configuration" "master-us-east-1a-masters-prod-k736-net" {
  name_prefix                 = "master-us-east-1a.masters.prod.k736.net-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-prod-k736-net-b4229c4c06c35abb9923878e1d485e13.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-prod-k736-net.id}"
  security_groups             = ["${aws_security_group.masters-prod-k736-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1a.masters.prod.k736.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  spot_price = "0.10"
}

resource "aws_launch_configuration" "master-us-east-1b-masters-prod-k736-net" {
  name_prefix                 = "master-us-east-1b.masters.prod.k736.net-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-prod-k736-net-b4229c4c06c35abb9923878e1d485e13.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-prod-k736-net.id}"
  security_groups             = ["${aws_security_group.masters-prod-k736-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1b.masters.prod.k736.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  spot_price = "0.10"
}

resource "aws_launch_configuration" "master-us-east-1c-masters-prod-k736-net" {
  name_prefix                 = "master-us-east-1c.masters.prod.k736.net-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-prod-k736-net-b4229c4c06c35abb9923878e1d485e13.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-prod-k736-net.id}"
  security_groups             = ["${aws_security_group.masters-prod-k736-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1c.masters.prod.k736.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  spot_price = "0.10"
}

resource "aws_launch_configuration" "nodes-prod-k736-net" {
  name_prefix                 = "nodes.prod.k736.net-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "r4.large"
  key_name                    = "${aws_key_pair.kubernetes-prod-k736-net-b4229c4c06c35abb9923878e1d485e13.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-prod-k736-net.id}"
  security_groups             = ["${aws_security_group.nodes-prod-k736-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.prod.k736.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = true
  }

  ebs_optimized = true

  lifecycle = {
    create_before_destroy = true
  }

  spot_price = "0.14"
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.prod-k736-net.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.prod-k736-net.id}"
}

resource "aws_route53_record" "api-prod-k736-net" {
  name = "api.prod.k736.net"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-prod-k736-net.dns_name}"
    zone_id                = "${aws_elb.api-prod-k736-net.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1IYOJY1Q5L0EB"
}

resource "aws_route_table" "prod-k736-net" {
  vpc_id = "${aws_vpc.prod-k736-net.id}"

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "prod.k736.net"
  }
}

resource "aws_route_table_association" "us-east-1a-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1a-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_route_table_association" "us-east-1b-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1b-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_route_table_association" "us-east-1c-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1c-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_route_table_association" "us-east-1d-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1d-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_route_table_association" "us-east-1e-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1e-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_route_table_association" "us-east-1f-prod-k736-net" {
  subnet_id      = "${aws_subnet.us-east-1f-prod-k736-net.id}"
  route_table_id = "${aws_route_table.prod-k736-net.id}"
}

resource "aws_security_group" "api-elb-prod-k736-net" {
  name        = "api-elb.prod.k736.net"
  vpc_id      = "${aws_vpc.prod-k736-net.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "api-elb.prod.k736.net"
  }
}

resource "aws_security_group" "masters-prod-k736-net" {
  name        = "masters.prod.k736.net"
  vpc_id      = "${aws_vpc.prod-k736-net.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "masters.prod.k736.net"
  }
}

resource "aws_security_group" "nodes-prod-k736-net" {
  name        = "nodes.prod.k736.net"
  vpc_id      = "${aws_vpc.prod-k736-net.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "nodes.prod.k736.net"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.masters-prod-k736-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.masters-prod-k736-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-prod-k736-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-prod-k736-net.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.api-elb-prod-k736-net.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-prod-k736-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 2382
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-prod-k736-net.id}"
  source_security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-prod-k736-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-prod-k736-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-east-1a-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1a.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "us-east-1b-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.32.0/19"
  availability_zone = "us-east-1b"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1b.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "us-east-1c-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.64.0/19"
  availability_zone = "us-east-1c"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1c.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "us-east-1d-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.96.0/19"
  availability_zone = "us-east-1d"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1d.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "us-east-1e-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.128.0/19"
  availability_zone = "us-east-1e"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1e.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_subnet" "us-east-1f-prod-k736-net" {
  vpc_id            = "${aws_vpc.prod-k736-net.id}"
  cidr_block        = "10.1.160.0/19"
  availability_zone = "us-east-1f"

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "us-east-1f.prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
    "kubernetes.io/role/elb"              = "1"
  }
}

resource "aws_vpc" "prod-k736-net" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                     = "prod.k736.net"
    Name                                  = "prod.k736.net"
    "kubernetes.io/cluster/prod.k736.net" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "prod-k736-net" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "prod.k736.net"
    Name              = "prod.k736.net"
  }
}

resource "aws_vpc_dhcp_options_association" "prod-k736-net" {
  vpc_id          = "${aws_vpc.prod-k736-net.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.prod-k736-net.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
