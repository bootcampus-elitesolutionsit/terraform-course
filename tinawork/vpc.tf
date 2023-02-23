#Vpc
resource "aws_vpc" "primary" {
  cidr_block         = "10.0.0.0/24"
  enable_dns_support = true
  instance_tenancy   = "default"

  tags = {
    Name = "primary"
    Env  = "dev"
  }
}

# Subnet - public
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
    Env  = "dev"
  }
}

# Subnet - private
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = "10.0.0.128/25"


  tags = {
    Name = "private_subnet"
    Env  = "dev"
  }
}

#IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "primary-igw"
    Env  = "dev"
  }
}


#Rtb
resource "aws_route_table" "primary_rtb" {
  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "primary-rtb"
    Evn  = "dev"
  }
}

resource "aws_route_table_association" "primary_rtb_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.primary_rtb.id
}