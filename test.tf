
provider "aws" {
  region = "${var.aws_region}"
  access_key = "AKIAIEML2QNR7IAGRNZA"
  secret_key =  "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"
}

module "security" {
  source = "./modules/aws_security"
  vpc_id = "${lookup(var.vpc_map, var.aws_vpc)}"
  vpc_cidr_block = "${lookup(var.vpc_cidrblock_map, lookup(var.vpc_map, var.aws_vpc))}"
}

module "ami" {
  source = "./modules/aws_ami"
}


module "datastax-cassandra" {
  source = "./modules/aws_datastax"
  aws_key_name = "${var.aws_key_name}"
  ami = "${module.ami.ami-id}"
  vpc_subnets = "${split(",", lookup(var.vpc_subnets_map, lookup(var.vpc_map, var.aws_vpc)))}"
  iam_instance_profile = "${lookup(var.vpc_iam_profile_map, lookup(var.vpc_map, var.aws_vpc))}"
  security_group = "${module.security.security_group}"
  environment = "${var.environment}"
  cluster_name = "dse"
  cluster_role = "datastax"
  cluster_domain = "${var.cluster_domain}"
  datastax_flavor = "${var.datastax_flavor}"
  datastax_count = "${var.datastax_count}"
}
