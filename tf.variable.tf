variable "ami" {
  description = "EC2 ami to be used"
  type        = string
  default     = "ami-0557a15b87f6559cf"
}


variable "instance_type" {
  description = "EC2 instance_type to be deployed"
  type        = string
  default     = "t2.micro"
}

variable "public_key" {
  description = "EC2 public key to be added for ssh"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZDVYDksToblFhgipBmWzs52VkI7xLULlyoq3iC7ylaspWnYKPsTjbRDXI5PiCUrBw3cFEeMp85gjFv7O+WIOdSwgzUGtb8vEFjPXwR1VYL5Gtag9rA35/6hBBMi9AcpjuFcV9+t5wymj1Tfvsq2i2l0DCwQcT9mc3rv5gPP/zFqBaOOx/I8stprwVCDBUNppWZPvIXeqZf7EL3gCGFI6JGbRtglrb7vfWksJvg8vQ/jHm4MxNSgBCVEs27SrkBG3VLEgefhBBYW2Iz7qwiYUxxFZHuyn/zqsUshFx4ismV+CyyOnKY8bCccnA2LKoaj8DPEB0qR9vSrh05HaayE0TyMMGJnvzmQpeZufm/YeogVKrC2xY6M05YrIj7BMkFvKlApur3gnvY4dfHp7g6DXJMUf5mvqmEtLf/nItx2PHbJrKtjiMCODcf6yjDJCIOv3fekOyVQSR7HXF6frf/GP3Y3b2r2SHaejB4eJscJqlhqj6Y/TOCqWZoWfBHyecGHM= nikky@adenikes-Air.lan"
}

variable "key_name" {
  description = "ssh key name"
  type        = string
  default     = "project_key"
}


variable "bucket" {
  type    = string
  default = "ade-tf-bucket"
}

variable "tag" {
  type = map(any)
  default = {
    Name = "projectserver"
    Env  = "Dev"
  }
}