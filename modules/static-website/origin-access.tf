module "origin-access-identity" {
  source = "../../resources/aws/cloudfront/origin-access-identity"

  cloudfront_name = terraform.workspace
}