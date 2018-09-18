data "aws_iam_policy_document" "codebuild" {
  statement {
    actions = [
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:us-east-2:${data.aws_caller_identity.current.account_id}:parameter/docker_hub_username",
      "arn:aws:ssm:us-east-2:${data.aws_caller_identity.current.account_id}:parameter/docker_hub_password"
    ]
  }
  # from https://docs.aws.amazon.com/codebuild/latest/userguide/setting-up.html#setting-up-service-role
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "codebuild" {
  name   = "${var.namespace}_codebuild"
  path   = "/"
  policy = "${data.aws_iam_policy_document.codebuild.json}"
}

resource "aws_iam_role_policy_attachment" "attach-codebuild-policy" {
    role       = "${module.iam_assume_role.this_iam_role_name}"
    policy_arn = "${aws_iam_policy.codebuild.arn}"
}
