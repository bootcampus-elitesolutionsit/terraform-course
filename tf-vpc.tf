# VPC
resource "aws_vpc" "Primary" {
  cidr_block         = "10.0.0.0/24"
  enable_dns_support = true
  instance_tenancy   = "default"

  tags = {
    Name = "Primary"
    Env  = "dev"
  }
}

# Subnet - Public
resource "aws_subnet" "Public_Subnet" {
  vpc_id                  = aws_vpc.Primary.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true

  tags = {
    Name = "Primary-public-subnet"
    Env  = "dev"
  }
}

# Subnet - Private
resource "aws_subnet" "Private_Subnet" {
  vpc_id                  = aws_vpc.Primary.id
  cidr_block              = "10.0.0.128/25"
  map_public_ip_on_launch = true

  tags = {
    Name = "Primary-Private-subnet"
    Env  = "dev"
  }
}
# Internet - GateWay
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Primary.id

  tags = {
    Name = "Primary-igw"
    Env  = "dev"
  }
}

# Route Table
resource "aws_route_table" "Primary_rtb" {
  vpc_id = aws_vpc.Primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Primary-rtb"
    Env  = "dev"
  }
}

# route_table_association
resource "aws_route_table_association" "Primary_rtb_assoc" {
  subnet_id      = aws_subnet.Public_Subnet.id
  route_table_id = aws_route_table.Primary_rtb.id
}

