# Vpc
resource "aws_vpc" "primary" {
  cidr_block         = local.cidr_block
  enable_dns_support = var.enable_dns_support
  instance_tenancy   = local.instance_tenancy

  tags = merge({ Name = "primary-vpc", Env = "dev" }, var.tags, local.network_tags)
}

# Subnet - Public
resource "aws_subnet" "Public_subnet_1" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true

  tags = {
    Name = "primary-public-subnet-1"
    Env  = "dev"
  }
}

# Subnet - Private
resource "aws_subnet" "Public_subnet_2" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "primary-public-subnet-2"
    Env  = "dev"
  }
}

# IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "primary-igw"
    Env  = "dev"
  }
}

# Rtb
resource "aws_route_table" "primary_rtb" {
  vpc_id = aws_vpc.primary.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "primary-rtb"
    Env  = "dev"
  }
}

# Rtb assoc
resource "aws_route_table_association" "primary_rtb_assoc_1" {
  subnet_id      = aws_subnet.Public_subnet_1.id
  route_table_id = aws_route_table.primary_rtb.id
}

resource "aws_route_table_association" "primary_rtb_assoc_2" {
  subnet_id      = aws_subnet.Public_subnet_2.id
  route_table_id = aws_route_table.primary_rtb.id
}