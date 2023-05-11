output "s3-website-url" {
  value = module.s3.hugo-webdomain
}

output "codecommit-url-ssh" {
  value = module.codepipeline.codecommit.clone_url_ssh
}

output "codecommit-url-http" {
  value = module.codepipeline.codecommit.clone_url_http
}