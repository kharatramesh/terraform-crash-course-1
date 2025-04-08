resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr[0]
  tags = {
    Name = "Trainer-VPC1"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "s1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet_cidr1[0]
  # availability_zone       = "ap-northeast-2a"
  tags = {
    Name = "Trainer-Subnet1"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_subnet" "s2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet_cidr2[0]
  # availability_zone       = "ap-northeast-2b"
  tags = {
    Name = "Trainer-Subnet2"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "Trainer-IGW1"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_route_table" "rtb1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    "Name" = "Trainer-Route-Table"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_route_table_association" "rt1-association1" {
  subnet_id      = aws_subnet.s1.id
  route_table_id = aws_route_table.rtb1.id
}

resource "aws_route_table_association" "rt2-association2" {
  subnet_id      = aws_subnet.s2.id
  route_table_id = aws_route_table.rtb1.id
}

resource "aws_route" "route1" {
  route_table_id         = aws_route_table.rtb1.id
  gateway_id             = aws_internet_gateway.igw1.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_internet_gateway.igw1]
}