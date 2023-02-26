
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
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQ+chFhkxgcYydYm2slWAq9BTh4dPR0AXCv8ipu92HprL77vWm0ac1VEdMJHl+LD2iud/QluNXFQuB0h460SF6ncs9gTbGKdZ2BOWLm0iAyk8atYhLPjf6KnF81QFJBOG0yl6jYLa99CiIo6dSRi3q/HQFqu9DbOMaWgBD/roy2tG252f0jn9tgbDjE5vBekfjowGS8Kn2halRDbp3/4v//ZBtvQuzbqzW6OEvPxbA1KIPsrWDjp9ZCCJifQvO/ShkGOW8Rw8OKJO0aRKd5oNwImVh0yVYrSKwBjFug8AXYaD18xL7L3DdtQh7pwAXrJkeCJCSbyxATnNHDm4czKuzM+1uiDMkGVlkw00FODHxSgGLcU36csCCwY/HM9+TEObpHLKJjMRew5l8oyqjB0MG35UeTXVLuV0tIb1B3SZMFoV1YmHq4QyetRuFwPhSrkxMXJDyK9gfnkIr0oC+iCnWlsAgkjKXMTG2UZ8K66xuRLS2f08xwNl0aqpSN5qwyVc= Owner@Preye"


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