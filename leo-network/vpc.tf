#VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = local.Network_tags
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "availability_zone" {}

# pulic & private subnets 

resource "aws_subnet" "tf-public-subnet-1" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.availability_zone.names[0]

  tags = {
    Name = "tf-public-subnet-1"
    Env  = "test"
  }
}

resource "aws_subnet" "tf-pubblic-subnet-2" {
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = data.aws_availability_zones.availability_zone.names[1]

  tags = {
    Name = "tf-pubblic-subnet-2"
    Env  = "test"
  }
}

# internet gateway

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "tf-igw"
    Env  = "test"
  }
}

# route table 

resource "aws_route_table" "tf-rt" {
  vpc_id = aws_vpc.tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }


  tags = {
    Name = "tf-rt"
    Env  = "test"
  }
}

# public rt association to public subnets

resource "aws_route_table_association" "subnet1-association" {
  subnet_id      = aws_subnet.tf-public-subnet-1.id
  route_table_id = aws_route_table.tf-rt.id
}

resource "aws_route_table_association" "subnet2-association" {
  subnet_id      = aws_subnet.tf-pubblic-subnet-2.id
  route_table_id = aws_route_table.tf-rt.id
}

