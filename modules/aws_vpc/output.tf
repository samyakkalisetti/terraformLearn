output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr_block" {
  value = "${var.vpc_cidr_block}"
}

output "vpc_gateway_id" {
  value = "${aws_internet_gateway.default.id}"
}

output "vpc_public_subnets" {
  value = ["${aws_subnet.vpc_public.*.id}"]
}
