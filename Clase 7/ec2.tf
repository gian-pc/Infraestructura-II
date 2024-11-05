resource "aws_instance" "instance_1a" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1a.id

  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hola!!!! $(hostname -f)</h1>" > /var/www/html/index.html
              EOF



  tags = {
    Name = "Instance_1a"
  }
}

resource "aws_instance" "instance_1b" {
  ami                     = "ami-0aa7d40eeae50c9a9"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1b.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hola!!!! $(hostname -f)</h1>" > /var/www/html/index.html
              EOF


  tags = {
    Name = "Instance_1b"
  }
}