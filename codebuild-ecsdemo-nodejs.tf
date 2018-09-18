resource "aws_codebuild_project" "nodejs" {
  name         = "${var.namespace_nodejs}-build"
  build_timeout      = "5"
  service_role = "${module.iam_assume_role.this_iam_role_arn}"
  badge_enabled = "true"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_MEDIUM"
    image        = "aws/codebuild/docker:17.09.0"
    type         = "LINUX_CONTAINER"
    privileged_mode = "true"
  }

  source {
    type            = "GITHUB"
    location        = "${var.github_url_nodejs}"
    buildspec       = "buildspec-dockerhub.yml"
    git_clone_depth = 0
    report_build_status = true
    auth = {
      type = "OAUTH"
      resource = "${var.GITHUB_TOKEN}"
    }
  }

  }

resource "aws_codebuild_webhook" "nodejs" {
  project_name = "${aws_codebuild_project.nodejs.name}"
}
