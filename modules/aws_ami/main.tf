data "aws_ami" "default" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name = "name"
    values = ["amzn-ami-hvm-2016.09.0.20160923-x86_64-gp2"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

output "ami-id"{
  value = "${data.aws_ami.default.id}"
}
