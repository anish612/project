resource "aws_instance" "public_instance" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  security_groups  = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  key_name = "testkey"
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF
  tags = {
    name = "public_instance"
  }
}


resource "aws_instance" "private_instance" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  key_name = "testkey"
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  EOF
  tags = {
    "name" = "private_instance"
  }
}
