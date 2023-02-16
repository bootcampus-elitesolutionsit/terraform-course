resource "aws_instance" "demo_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.Public_subnet_1.id
  vpc_security_group_ids = [data.aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ssh_key.key_name
  user_data_base64       = data.cloudinit_config.php.rendered
  tags                   = merge({ Name = "php-demoapp", Env = "dev" }, var.tags, local.application_tags)
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}
