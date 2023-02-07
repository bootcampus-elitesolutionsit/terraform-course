#VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block         = "10.0.0.0/24"
  enable_dns_support = true
  instance_tenancy   = "default"

  tags = {
    Name = "tf-vpc"
    Env  = "test"
  }
}

# pulic & private subnets 

resource "aws_subnet" "tf-public-subnet" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-public-subnet"
    Env  = "test"
  }
}

resource "aws_subnet" "tf-private-subnet" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "10.0.0.128/25"

  tags = {
    Name = "tf-private-subnet"
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

# public rt association to public subnet

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.tf-public-subnet.id
  route_table_id = aws_route_table.tf-rt.id
}