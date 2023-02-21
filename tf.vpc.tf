# vpc
resource "aws_vpc" "nikky" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "nikky"
    Env  = "dev"
  }
}

# subnet-public
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.nikky.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "nikky_public_subnet"
    Env  = "dev"
  }
}
# subnet-private
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.nikky.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "nikky_private_subnet"
    Env  = "dev"
  }
}
# internet_gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.nikky.id

  tags = {
    Name = "nikky_igw"
    Env  = "dev"
  }
}
# route_tables
resource "aws_route_table" "nikky_rtb" {
  vpc_id = aws_vpc.nikky.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "nikky_rtb"
    Env  = "dev"
  }
}
# route_table_association
resource "aws_route_table_association" "nikky_rtb_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.nikky_rtb.id
}