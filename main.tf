output "Build Badge URL: Frontend" {
  value = "${aws_codebuild_project.frontend.badge_url}"
}

output "Build Badge URL: NodeJS" {
  value = "${aws_codebuild_project.nodejs.badge_url}"
}

output "Build Badge URL: Crystal" {
  value = "${aws_codebuild_project.crystal.badge_url}"
}
