variable "project-name" {
  # default = "hugo-web"
}

variable "project-tags" {
  type = map(any)
  # default = {
  #   "Project" : "Hugoweb with aws codepipeline"
  #   "author" : "terraform"
  # }
}