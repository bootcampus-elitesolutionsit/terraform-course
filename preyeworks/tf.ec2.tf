resource "aws_instance" "webtoon" {
  ami                    = var.ami #Amazon linux
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.Public_subnet.id
  vpc_security_group_ids = [aws_security_group.tf_sg.id]
  key_name               = aws_key_pair.ssh_key.key_name

  tags = var.tags

}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = var.public_key
}