resource "aws_s3_bucket" "s3_artifacts" {
  bucket = "${var.project_name}-artifact-${substr(random_uuid.s3-uuid.result, 0, 5)}"

  tags = var.project_tags
}

resource "aws_s3_bucket_ownership_controls" "s3_artifacts_owner" {
  bucket = aws_s3_bucket.s3_artifacts.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_artifacts_acl" {
  bucket = aws_s3_bucket.s3_artifacts.id
  acl    = "private"
  depends_on = [ aws_s3_bucket_ownership_controls.s3_artifacts_owner ]
}