resource "aws_cloudfront_distribution" "scope" {
  comment             = var.cloudfront_name
  enabled             = var.enabled
  is_ipv6_enabled     = true
  default_root_object = var.root_object
  web_acl_id          = var.waf_association

  depends_on = [
    aws_s3_bucket.logging
  ]

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method             = "TLSv1.2_2021"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  logging_config {
    bucket          = aws_s3_bucket.logging.bucket_domain_name
    include_cookies = false
  }

  default_cache_behavior {
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    default_ttl = var.default_ttl
    min_ttl     = var.min_ttl
    max_ttl     = var.max_ttl

    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }
  }

  origin {
    domain_name = var.domain_name
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = var.origin_access_identity
    }
  }

  tags = var.tags
}

output "domain_name" {
  value = aws_cloudfront_distribution.scope.domain_name
}