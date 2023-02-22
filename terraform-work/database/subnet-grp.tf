resource "aws_db_subnet_group" "db-sub-grp" {
  name       = "db-sub-grp"
  subnet_ids = ["subnet-04ac10c19d64f1b77", "subnet-0b481f608f023e150"]

  tags = {
    Name = "db-sub-grp"
  }
}