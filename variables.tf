variable "aws_region" {
  type = "string"
  description = "AWS Region ID"
  default = "us-east-1"
}

variable "aws_key_name" {
  type = "string"
  description = "AWS EC2 key pair name"
}

variable "aws_vpc" {
  type = "string"
  description = "Logical vpc identifier. Must be one of the keys defined in vpc_map"
  default = "xbi-sandbox"
}
variable "vpc_subnets_zones" {
  type = "map"
  description = "map vpc subnets availability zones"
  default = {
    vpc-0c608768 = "us-east-1a,us-east-1e,us-east-1c,us-east-1d"
  }
}
variable "cluster_domain" {
  type = "string"
  description = "Unique domain for the cluster, e.g. mycluster.internal"
}

variable "environment" {
  type = "string"
  description = "Headwaters environment, e.g. 'prod', 'sandbox', 'dev'"
  default = "test-dbox"
}

# To add a supported VPC, create a new mapping here, and
# add the appropriate mappsings for that VPC ID to the
# vpc_cidrblock_map and vpc_subnets_map
variable "vpc_map" {
  type = "map"
  description = "map of logical vpc name to vpc ids"
  default = {
    xbi-sandbox = "vpc-0c608768"
  }
}

variable "vpc_cidrblock_map" {
  type = "map"
  description = "map of vpc ids to cidr block"
  default = {
    vpc-0c608768 = "172.31.0.0/16"
  }
}

variable "vpc_subnets_map" {
  type = "map"
  description = "map of vpc ids to subnets"
  default = {
    vpc-0c608768 = "subnet-bbbaf6e2,subnet-0297723f,subnet-ed2959c6,subnet-f3e1d484"
  }
}

variable "vpc_iam_profile_map" {
  type = "map"
  description = "map of vpc ids to iam instance profiles"
  default = {
    vpc-0c608768 = "headwaters-sandbox"
  }
}

variable "datastax_count" {
  type = "string"
  default = "3"
}

variable "datastax_flavor" {
  type = "string"
  default = "m4.xlarge"
}
