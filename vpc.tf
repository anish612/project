resource "aws_vpc" "main" {               #Creating VPC
  cidr_block = "10.0.0.0/16"              #assigning CIDR block
  instance_tenancy = "default"

  tags = {
    name = "main"
  }
}

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


resource "aws_internet_gateway" "mygateway" {     #creating internet gateway for public subnet
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "mygateway"
  }
}


resource "aws_route_table" "myroute" {      #creating route table 
  vpc_id = aws_vpc.main.id                       
  route = []
  tags = {
    name = "myroute"
  }

}



