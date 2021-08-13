terraform {
  backend "s3" {
    bucket  = "chk-tfstate"
    key     = "terraform/aws/myfirstproduct.tfstate"
    region  = "eu-west-1"
    profile = "personal"
    encrypt = true
  }

  required_version = "= 0.13.5"
}

provider "aws" {
  version = "~> 3.44.0"
  profile = "personal"
  region  = "eu-west-1"
}