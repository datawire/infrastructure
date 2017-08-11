// file: iam/kubernaut_backend.tf

resource "aws_iam_policy" "kubernaut_backend_policy" {
  name        = "kubernaut_backend_policy"
  path        = "/cloud/"
  description = "policy for kubernaut_backend"
  policy      = "${file("${path.module}/kubernaut_backend-policy.json")}"
}

resource "aws_iam_user" "kubernaut_backend" {
  name = "kubernaut_backend"
  path = "/cloud/"
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = "${aws_iam_user.kubernaut_backend.name}"
  policy_arn = "${aws_iam_policy.kubernaut_backend_policy.arn}"
}
