variable "aws_key_name" {}
variable "ami" {}
variable "vpc_subnets" { type = "list" }
variable "iam_instance_profile" {}
variable "security_group" {}
variable "environment" {}
variable "cluster_name" {}
variable "cluster_role" {}
variable "cluster_domain" {}
variable "cloud_init" { default = "" }
variable "datastax_count" { default = "3" }
variable "datastax_flavor" { default = "m4.xlarge" }
