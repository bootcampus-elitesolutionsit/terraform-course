resource "aws_instance" "php-server" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.tf-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.php_key.key_name
  tags                   = local.common_tags

  #user data for amazon linux
  user_data = file("userdata.sh")
}



resource "aws_key_pair" "php_key" {
  key_name   = "php_key"
  public_key = var.ssh-key
}