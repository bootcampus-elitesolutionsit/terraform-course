# EC2 variable
variable "ami" {
  description = "Ec2 AMI ID to be Used"
  type        = string
  default     = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  description = "EC2 Instance type to be deployed"
  type        = string
  default     = "t2.micro"
}

variable "public_key" {
  description = "EC2 Key Pair to be added for ssh"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCe3brMV65ll5PTAQb8sLSZOxPYAic/thxPFCmrPUb6z82a8wIz5oDL+3Ik8o20+g0Z3oS6Fa6cwzzkYifE6DNqkJMzpnuLQsUwgS48bHnJi6YJhrHRVukP39DfggmJjjZJ0Ig+XTWnQFWteCK8UBaSq+x71FUgreCatvgqw2P1ZJ89Py91zmlJ59T3NHYIlCu10GusOk75sejKIAqFUu/NJ5Z1dmSLCrC0EWFD99G/jj0ad0lCm2+cWm+8tWdljasaeFMzA2WHrKaer7eL8+qQfiMopvZGxKKk1719xQ0mykr4eQzDJOfq+YXpz46edyXzdXSP2Zjt9OjMBDtGmINO4/44yArZ6SXa+ifLaTrd+DkOxoTtV8Bs6tRu5czcmTKIdTZy6YD/hXBhCFXawO1EkB+Zs+D3DYcsWoFJcTfh/Y5h7zvFJgMrt6USyAfxYLEiil31OxMQOg0I0rfw0w2s3Km/EMjmIozJBqXPG5tdFoA+BpAvSfIHYm9Hk1vwvi0= lbena@LAPTOP-QB0DU4OG"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
  default     = "php-key"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "target_group_name" {
  type    = string
  default = "tgt-php-demo"
}

variable "port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "username" {
  type = string
}

variable "group" {
  type = string
}

variable "Repository" {
  type = string
}

variable "db_secrets" {
  type = string
}