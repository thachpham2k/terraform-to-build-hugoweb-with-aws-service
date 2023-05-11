data "local_file" "buildspec_local" {
  filename = "${path.module}/buildspec.yml.tmpl"
}

resource "aws_codebuild_project" "codebuild" {
  name          = "${var.project_name}-codebuild"
  build_timeout = "5"
  service_role  = aws_iam_role.codepipeline_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
    environment_variable {
      name  = "S3_BUCKET"
      value = var.s3_bucket.bucket
    }
  }

  source {
    type            = "CODECOMMIT"
    location        = aws_codecommit_repository.codecommit.clone_url_http
    git_clone_depth = 1
    # buildspec       = data.local_file.buildspec_local.content
    buildspec = "buildspec.yml"
  }

  tags = var.project_tags
}