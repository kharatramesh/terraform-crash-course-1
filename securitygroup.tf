resource "aws_security_group" "sg1" {
  vpc_id = aws_vpc.vpc1.id
  name   = var.sgname
  tags = {
    Name = "Trainer-SG1"
  }
  dynamic "ingress" {
    for_each = var.nsgrule
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}