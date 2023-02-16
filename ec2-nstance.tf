
# Create VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create internet gateway
resource "aws_internet_gateway" "dev_gw" {
  vpc_id = aws_vpc.dev-vpc.id
}

# Create subnet
resource "aws_subnet" "dev-subnet" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"
}

# Create security group
resource "aws_security_group" "dev-scgroup" {
  name_prefix = "dev-sc"
  vpc_id      = aws_vpc.dev-vpc.id

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instance
resource "aws_instance" "server_dev" {
  ami                    = "ami-0735c191cf914754d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dev-subnet.id
  vpc_security_group_ids = [aws_security_group.dev-scgroup.id]
}
