variable "region" {
  default = "us-east-1"
}
variable "availability_zones" {
  type = list
  default = ["us-east-1a", "us-east-1b"]
}


variable "Environment" {
  default = "dev"
}
variable "ProjectName" {
  default = "demo"
}


variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  type = list
  default = ["10.0.0.0/24"]
}
variable "private_subnet_cidrs" {
  type = list
  default = ["10.0.1.0/24"]
}