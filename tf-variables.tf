variable "tags" {
  type    = map(any)
  default = {}
}

variable "ami" {
  type    = string
  default = "ami-0557a15b87f6559cf"
}