output "codecommit" {
  value = aws_codecommit_repository.codecommit
}

output "s3" {
  value = aws_s3_bucket.s3_artifacts
}