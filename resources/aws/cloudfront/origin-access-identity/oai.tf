resource "aws_cloudfront_origin_access_identity" "scope" {
  comment = "${var.cloudfront_name}-oai"
}

output "iam_arn" {
  value = aws_cloudfront_origin_access_identity.scope.iam_arn
}

output "cloudfront_access_identity_path" {
  value = aws_cloudfront_origin_access_identity.scope.cloudfront_access_identity_path
}