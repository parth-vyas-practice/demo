terraform {
  backend "s3" {
    bucket  = "cf-templates-9emr904unwy6-us-east-1"
    encrypt = true
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
  }
}