resource "aws_security_group" "default" {

  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
