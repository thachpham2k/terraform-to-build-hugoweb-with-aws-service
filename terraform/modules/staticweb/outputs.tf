output "hugo-webdomain" {
  value = aws_s3_bucket_website_configuration.s3_bucket_config.website_endpoint
}

output "s3-bucket" {
  value = aws_s3_bucket.s3_bucket
}