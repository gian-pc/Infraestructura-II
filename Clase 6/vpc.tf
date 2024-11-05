resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia_cidr

  tags = {
    "Name" = "vpc_virginia"
  }
}

# ------------------------ 1a -----------------------

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

  depends_on = [ aws_subnet.public_subnet_1a ]
}


# ---------------------------- 1b ---------------------

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

  depends_on = [ aws_subnet.public_subnet_1b ]
}



# --------------- Gateway ----------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc virginia"
  }
}


# ---------------- Route Table ------------------

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public crt"
  }
}

# ---------------- Route Table Associate ------------------

resource "aws_route_table_association" "crta_public_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_route_table_association" "crta_public_subnet_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_crt.id
}


# ---------------- Security Group --------------------------

resource "aws_security_group" "sg_public_instance" {
  name = "Public Instance SG"
  description = "Permitir trafico entrante SSH y todo el trafico saliente"
  vpc_id = aws_vpc.vpc_virginia.id

  ingress {
    description = "SSH a traves de internet"
    from_port = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Public Instance SG"
  }
}