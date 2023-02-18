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
    content      = templatefile("templates/userdata_php.tpl", {})
  }

}
