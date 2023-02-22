resource "aws_db_parameter_group" "rds-par-grp" {
  name        = "rds-par-grp"
  family      = "mysql8.0"
  description = "RDS parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }
}