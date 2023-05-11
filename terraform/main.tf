module "s3" {
  source = "./modules/staticweb"

  project-name = var.project-name
  project-tags = var.project-tags
}

module "codepipeline" {
  source = "./modules/cicd"

  s3_bucket     = module.s3.s3-bucket
  project_name  = var.project-name
  repo_src_path = "../src"
  project_tags  = var.project-tags
}