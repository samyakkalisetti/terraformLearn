
resource "aws_instance" "datastax" {
  ami = "${var.ami}"
  instance_type = "${var.datastax_flavor}"
  key_name = "${var.aws_key_name}"
  count = "${var.datastax_count}"
  subnet_id = "${element(var.vpc_subnets, count.index % length(var.vpc_subnets))}"
  iam_instance_profile = "${var.iam_instance_profile}"
  associate_public_ip_address  = true
  vpc_security_group_ids = ["${var.security_group}"]
  ebs_optimized = "true"

  tags {
    Name = "datastax-${format("%d", count.index + 1)}"
    role = "datastax"
    environment = "${var.environment}"
    cluster_name = "${var.cluster_name}"
    cluster_role = "${var.cluster_role}"
    cluster_domain = "${var.cluster_domain}"
  }
}


output "datastax-public" {
  value = "${aws_instance.datastax.public_ip}"
}

output "datastax-private" {
  value = "${aws_instance.datastax.private_ip}"
}
