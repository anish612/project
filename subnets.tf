
resource "aws_subnet" "public-subnet" {     #Creating public subnet here
  vpc_id = aws_vpc.main.id                   #assigning VPC ID to subnet(VPC ID will be generated automatically when we create VPC)
  cidr_block = "10.0.1.0/24"                 #CIDR block of public subnet
  availability_zone = "us-east-1a"          #availability zone of public subnet
  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {     #creating private subnet
  vpc_id = aws_vpc.main.id   
  cidr_block = "10.0.2.0/28"
  availability_zone = "us-east-1b"
  tags = {
    "name" = "private_subnet"
  }
}

