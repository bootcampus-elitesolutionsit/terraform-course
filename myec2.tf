resource "aws_instance" "project_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.project_ssh_key.key_name
  tags = {
    Name = "projectserver"
    Env  = "dev"
  }
}

resource "aws_key_pair" "project_ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}