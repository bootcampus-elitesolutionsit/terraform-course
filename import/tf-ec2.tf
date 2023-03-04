resource "aws_instance" "nginx" {
  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  user_data              = aws_secretsmanager_secret_version.user_data.secret_string
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }

  tags = {
    Name = "import-ec2"
  }
}