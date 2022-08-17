resource "aws_vpc" "main" {               #Creating VPC
  cidr_block = "10.0.0.0/16"              #assigning CIDR block
  instance_tenancy = "default"

  tags = {
    name = "main"
  }
}

resource "aws_internet_gateway" "mygateway" {     #creating internet gateway for public subnet
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "mygateway"
  }
}


resource "aws_route_table" "myroutetable" {      #creating route table 
  vpc_id = aws_vpc.main.id                       
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygateway.id
  }

  tags = {
    name = "myroute"
  }
  

}

resource "aws_route" "myroute" {
  route_table_id = aws_route_table.myroutetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.mygateway.id
 
}

resource "aws_route_table_association" "myassociation1" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.myroutetable.id
}

resource "aws_route_table_association" "myassociation2" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.myroutetable.id

}
