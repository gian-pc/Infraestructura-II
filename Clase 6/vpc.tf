resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia_cidr

  tags = {
    "Name" = "vpc_virginia"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "public_subnet_1a"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "private_subnet_1a"
  }
}


resource "aws_subnet" "public_subnet_1b" {
  vpc_id                 = aws_vpc.vpc_virginia.id
  cidr_block             = var.subnets[2]
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    "Name" = "public_subnet_1b"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[3]
  availability_zone       = "us-east-1b"

  tags = {
    "Name" = "private_subnet_1b"
  }
}