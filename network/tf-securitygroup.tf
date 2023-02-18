resource "aws_security_group" "ec2_sg" {
  name        = "ec-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.primary.id

  ingress {
    description = "SSH access from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]
  }

  ingress {
    description = "Mariadb access from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]
  }

  ingress {
    description     = "Httpd access from lb to ec2"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.primary.id


  ingress {
    description = "Httpd access from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]
  }

  ingress {
    description = "Httpd access from VPC"
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

  tags = local.common_tags
}