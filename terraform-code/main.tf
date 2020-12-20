terraform {
  required_version = ">= 0.12.6, < 0.14"

  required_providers {
    aws = "~> 2.70.0"
  }
}

provider "aws" {
  region = var.region
}

locals {
  prefix = "${var.Environment}-${var.ProjectName}"
}

module "dev-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"

  name = "${local.prefix}-vpc"
  cidr = var.vpc_cidr
  azs             = var.availability_zones
  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  private_subnet_tags = {
    Tier = "Private"
  }
  public_subnet_tags = {
    Tier = "Public"
  }

  enable_nat_gateway = true
  enable_dns_hostnames = true
}