resource "null_resource" "uploader" {
  provisioner "local-exec" {
    command     = "aws s3 cp --recursive ui/ s3://${terraform.workspace} --profile personal"
    working_dir = "../../app-code"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [
    module.static-website-s3
  ]
}