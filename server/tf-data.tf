data "aws_subnet" "Public_subnet_1" {
  id = local.Public_subnet_1
}

data "aws_subnet" "Public_subnet_2" {
  id = local.Public_subnet_2
}

data "aws_security_group" "ec2_sg" {
  id = local.ec2_sg
}

data "aws_security_group" "lb_sg" {
  id = local.lb_sg
}

data "aws_vpc" "vpc_id" {
  id = local.vpc_id
}

data "aws_route53_zone" "zone" {
  name         = local.hosted_zone_name
  private_zone = false
}


data "cloudinit_config" "php" {
  gzip          = true
  base64_encode = true

  # part {
  #   content_type = "text/x-shellscript"
  #   content      = "phuserdata_phpp"
  #   filename     = "userdata_php.sh"
  # }

  part {
    content_type = "text/x-shellscript"
    filename     = "userdata_php"
    content = templatefile("../templates/userdata_php.tpl",

      {
        username   = var.username
        group      = var.group
        Repository = var.Repository
        db_name    = var.db_name
        db_user    = var.db_user
        db_secrets = aws_secretsmanager_secret_version.version.secret_string
    })
  }
}
