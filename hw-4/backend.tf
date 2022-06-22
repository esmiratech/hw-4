#S3 backend
terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    region  = "us-east-1"
    key     = "esmiraterraform"
    bucket  = "esmirapractice"
  }
}
#Providers
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
