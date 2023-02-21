resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet01"
  }
}
resource "aws_internet_gateway" "myfirstgw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myfirstgw"
  }
}
