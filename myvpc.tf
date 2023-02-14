resource "aws_vpc" "devprovider" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_internet_gateway" "dev-gateway" {
  vpc_id = devprovider.id

  tags = {
    Name = "devprovider-gw"
  }
}


resource "aws_route_table" "dev-routetable {
  vpc_id = devprovider.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = dev-gateway.id
  }

  tags = {
    Name = "dev-routetable"
  }
