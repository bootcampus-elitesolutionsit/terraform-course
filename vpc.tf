resource "aws_vpc" "databasevpc" {
  cidr_block = "10.0.0.0/16"
}

#subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.databasevpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "datasubnetpublic"
  }
}

#subnet

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.databasevpc.id
  cidr_block = "10.0.0.0/26"

  tags = {
    Name = "datasubnetprivate"
  }
}



#INTERNETGATEWY

resource "aws_internet_gateway" "datagateway" {

  vpc_id = aws_vpc.databasevpc.id

  tags = {
    Name = "datagateway"
  }
}

#route-table
resource "aws_route_table" "dataroute" {
  vpc_id = aws_vpc.databasevpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.datagateway.id
  }

  tags = {
    Name = "datagateway"
  }
}



