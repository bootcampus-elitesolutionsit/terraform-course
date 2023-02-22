resource "aws_security_group" "rds-sg" {
  name_prefix = "rds-sg"
  description = "RDS security group"
 vpc_id       = "${var.vpc_id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }
}