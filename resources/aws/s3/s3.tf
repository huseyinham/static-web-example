resource "aws_s3_bucket" "scope" {
  bucket = var.bucket_name
  acl    = var.acl

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "scope" {
  count = var.acl == "private" ? 1 : 0

  bucket = aws_s3_bucket.scope.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "scope" {
  count = var.bucket_policy_required == true ? 1 : 0

  bucket = aws_s3_bucket.scope.id
  policy = var.bucket_policy
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.scope.bucket_regional_domain_name
}