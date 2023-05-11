resource "random_uuid" "s3-uuid" {
}

# Tạo một commit và tải lên tệp từ thư mục cục bộ
resource "null_resource" "upload_file" {
  depends_on = [
    aws_codecommit_repository.codecommit,
  ]
  provisioner "local-exec" {
    command = "bash ${path.root}/CredentialHelper.sh"
  }
  provisioner "local-exec" {
    command = "cd ${path.root}/${var.repo_src_path} &&  (rm -rf .git ; git init) && (git add . && git commit -m 'automation commit' && git remote add origin ${aws_codecommit_repository.codecommit.clone_url_http} && git push origin HEAD:main)"
  }
}