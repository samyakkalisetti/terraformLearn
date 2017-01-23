variable "aws_region" {}
variable "vpc_cidr_block" {
  type = "string"
  description = "VPC network cidr block. Must be a /16 block."
  default = "10.0.0.0/16"
}
variable "zones" {
  type = "map"
  default = {
    us-east-1 = ["us-east-1a", "us-east-1c", "us-east-1d", "us-east-1e"]
  }
}
