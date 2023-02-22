resource "aws_db_instance" "terradb" {
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = "8.0.28"
  storage_type           = "gp2"
  instance_class         = var.db_class
  username               = var.username
  password               = var.db_password
  parameter_group_name   = var.parameter_grp
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name   = "db-sub-grp"
  skip_final_snapshot    = true
  multi_az               = false

  depends_on = [
    aws_db_parameter_group.rds-par-grp,
    aws_security_group.rds-sg,
    aws_db_subnet_group.db-sub-grp
  ]
}