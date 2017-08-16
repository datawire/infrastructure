// file: iam/scout.tf

resource "aws_iam_policy" "scout_policy" {
  name        = "scout_policy"
  path        = "/cloud/"
  description = "policy for scout"
  policy      = "${file("${path.module}/scout-policy.json")}"
}

resource "aws_iam_user" "scout" {
  name = "scout"
  path = "/cloud/"
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = "${aws_iam_user.scout.name}"
  policy_arn = "${aws_iam_policy.scout_policy.arn}"
}
