resource "aws_s3_bucket" "logging" {
  bucket = "${var.cloudfront_name}-cloudfront-logging"
  acl    = "private"

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "scope" {
  bucket = aws_s3_bucket.logging.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}