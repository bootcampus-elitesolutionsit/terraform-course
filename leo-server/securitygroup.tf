
# security group for ssh nginx server
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = data.aws_vpc.tf-vpc.id


  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]
  }

  ingress {
    description     = "mariadb access to rds instance"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.rds_sg.id]
  }


  ingress {
    description     = "TLS from VPC http"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description     = "TLS from VPC https"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
    Env  = "test"
  }
}




# ALB security group

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow http inbound traffic"
  vpc_id      = data.aws_vpc.tf-vpc.id


  ingress {
    description = "TLS from VPC http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["76.198.149.152/32"]
  }

  ingress {
    description = "TLS from VPC https"
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
    Name = "allow-https"
    Env  = "test"
  }
}