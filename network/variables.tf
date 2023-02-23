
variable "ami" {
  description = "Ec2 AMI 1D to be used"
  type        = string
  default     = "ami-0cc87e5027adcdca8"
}

variable "instance_type" {
  description = "Ec2 instance type to be deployed"
  type        = string
  default     = "t2.micro"

}

variable "public_key" {
  description = "Ec2 Key Pair to be added for ssh"
  type       = string
  default    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9nShxf5y67V2qCLWIyRIaMRY1eI0UQSQed0Lm+A/BmYQtIk294Y28QUdYLQ65QRWXG9JNrp3//HtNj7lVun2MgTxWLDogoYwAdURuXkZ1bVrtcmBfQhqhcj8fsBzzII2i1roVCBoZviG7MBfbDDbuQJUoM7mm5CVpWGpomf9hYiaM4p5qNLU1D2WtJNp0LBtU9evTKyC19xk0F3fuxOwyyq9HyM2pPgflva+mIwQKsFa8Tpua14xrm5/jAurPFxjpwFXpBO/ZJMQep/9JRdIAW7rGaUh0DnaxpDsIRUW9RmSfwDgS+41gHhbjCNlzi5zXj7ueFsWY06Jk4rq0YJBSJW3dk09ZHhATQ/C3wBFtw8Q/sfFHlW27znucDyL2dCB+zbJ5jWs3Dd3G/VSVSk/h6qbcJfAMGfisPgIiQA17JVsawbzD7c1ROl/TizhNrd3JpWRxAyy/MeiSrl2VbDD2WyJGNLS6/ns6NVbqMkNzM8N1NLQS79WHJpyHxkj+Rcc= Owner@Preye"

}

variable "key_name" {
  description = "ssh key name"
  type        = string
  default     = "worldserver-key"
}

#vpc variable
variable "enable_dns_support" {
  description = "Defaults tofalse  but can be overide using this variable 'enable_dns_support' "
  type        = bool
  default     = true
}