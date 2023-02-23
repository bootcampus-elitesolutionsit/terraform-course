
resource "aws_security_group" "tf_sg" {
  name        = "Allow-ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.devops.id




  ingress {
    description = "SSH access from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]

  }

  ingress {
    description = "Httpd"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]

  }

  ingress {
    description = "Https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-sg"
    Env  = "Dev"
  }

}