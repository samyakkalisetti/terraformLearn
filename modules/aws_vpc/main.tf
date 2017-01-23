resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "vpc_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id = "${aws_vpc.vpc.id}"
  route_table_id = "${aws_route_table.vpc_public.id}"
}

resource "aws_subnet" "vpc_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  count = "${length(var.zones[var.aws_region])}"
  cidr_block = "${cidrsubnet(var.vpc_cidr_block, 4, count.index)}"
  availability_zone = "${element(var.zones[var.aws_region], count.index)}"
}

resource "aws_iam_role" "default" {
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com",
          "codedeploy.amazonaws.com"
        ]
      }
    }
  ]
}
EOF
}
