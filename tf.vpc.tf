# Vpc
resource "aws_vpc" "devops" {
  cidr_block         = "10.0.0.0/24"
  enable_dns_support = true
  instance_tenancy   = "default"

  tags = {
    Name = "devops"
    Env  = "Dev"
  }
}

# Subnet - Public
resource "aws_subnet" "Public_subnet" {
  vpc_id                  = aws_vpc.devops.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true



  tags = {
    Name = "new-public-subnet"
    Env  = "dev"
  }
}

# Subnet - Private
resource "aws_subnet" "Private_subnet" {
  vpc_id     = aws_vpc.devops.id
  cidr_block = "10.0.0.128/25"


  tags = {
    Name = "new-private-subnet"
    Env  = "dev"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops.id

  tags = {
    Name = "New-igw"
    Env  = "dev"
  }
}

# Rtb
resource "aws_route_table" "primary_rtb" {
  vpc_id = aws_vpc.devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "primary-rtb"
    Env  = "dev"
  }
}

# Rtb assoc
resource "aws_route_table_association" "primary_rtb_assoc" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.primary_rtb.id
}