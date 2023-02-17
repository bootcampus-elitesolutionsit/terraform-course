resource "aws_instance" "project_server" {
  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.project_ssh_key.key_name
  tags = {
    Name = "projectserver"
    Env  = "dev"
  }
}

resource "aws_key_pair" "project_ssh_key" {
  key_name   = "project_ssh_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZDVYDksToblFhgipBmWzs52VkI7xLULlyoq3iC7ylaspWnYKPsTjbRDXI5PiCUrBw3cFEeMp85gjFv7O+WIOdSwgzUGtb8vEFjPXwR1VYL5Gtag9rA35/6hBBMi9AcpjuFcV9+t5wymj1Tfvsq2i2l0DCwQcT9mc3rv5gPP/zFqBaOOx/I8stprwVCDBUNppWZPvIXeqZf7EL3gCGFI6JGbRtglrb7vfWksJvg8vQ/jHm4MxNSgBCVEs27SrkBG3VLEgefhBBYW2Iz7qwiYUxxFZHuyn/zqsUshFx4ismV+CyyOnKY8bCccnA2LKoaj8DPEB0qR9vSrh05HaayE0TyMMGJnvzmQpeZufm/YeogVKrC2xY6M05YrIj7BMkFvKlApur3gnvY4dfHp7g6DXJMUf5mvqmEtLf/nItx2PHbJrKtjiMCODcf6yjDJCIOv3fekOyVQSR7HXF6frf/GP3Y3b2r2SHaejB4eJscJqlhqj6Y/TOCqWZoWfBHyecGHM= nikky@adenikes-Air.lan"
}
