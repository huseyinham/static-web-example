module "static-website-cloudfront" {
  source = "../../resources/aws/cloudfront"

  cloudfront_name = terraform.workspace
  enabled         = true

  domain_name            = module.static-website-s3.bucket_regional_domain_name
  origin_access_identity = module.origin-access-identity.cloudfront_access_identity_path
  waf_association        = ""
  root_object            = "index.html"

  default_ttl = 120
  min_ttl     = 60
  max_ttl     = 180

  origin_id = "${terraform.workspace}-s3"

  tags = {
    Name      = terraform.workspace
    Workspace = terraform.workspace
  }

  depends_on = [
    module.origin-access-identity,
    module.static-website-s3
  ]
}