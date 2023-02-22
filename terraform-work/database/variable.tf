variable "db_name" {
  type = string
  default = "terradb"
}

variable "db_class" {
  type = string
  default = "db.t2.micro"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "8Nw99k4j6J18YzOH"
}

variable "parameter_grp" {
  type    = string
  default = "rds-par-grp"

}

variable "subnetgrp" {
  type    = string
  default = "db-sub-grp"

}

variable "vpc_id" {
  type = string
  default = "vpc-054143a6e8913dc60"
  
}

variable "cidr_blocks" {
  type    = string
  default = "10.0.0.0/18"
}
