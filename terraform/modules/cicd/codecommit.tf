resource "aws_codecommit_repository" "codecommit" {
  repository_name = "${var.project_name}-codecommit"

  tags = var.project_tags
}