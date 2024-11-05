resource "aws_instance" "instance_1a" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1a.id
  tags = {
    Name = "Instance_1a"
  }
}

resource "aws_instance" "instance_1b" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1b.id
  tags = {
    Name = "Instance_1b"
  }
}