module "static-website-s3" {
  source = "../../resources/aws/s3"

  bucket_name = terraform.workspace
  acl         = "private"

  tags = {
    Name      = terraform.workspace
    Workspace = terraform.workspace
  }

  bucket_policy_required = true
  bucket_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : module.origin-access-identity.iam_arn,
        },
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::${terraform.workspace}/*"
      }
    ]
  })

  depends_on = [
    module.origin-access-identity
  ]
}