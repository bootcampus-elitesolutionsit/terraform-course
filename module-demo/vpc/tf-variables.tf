variable "cidr_block" {
  description = "CIDR for VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Value fo DNS suport for VPC"
  type        = bool
}

variable "instance_tenancy" {
  description = "Instance tenancy for VPC"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "map_public_ip_on_launch" {
  description = "Public IP for subnet"
  type        = bool
}

variable "cidr_block_route" {
  description = "route for internet to public subnet"
  type        = string
  default     = "0.0.0.0/0"
}

variable "create_vpc" {
  type    = bool
  default = true
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "security_group" {
  type    = bool
  default = true
}

variable "security_group_ingress" {
  description = "List of maps of ingress rules to set on the security group"
  type        = list(map(string))
  default     = null
}

variable "security_group_egress" {
  description = "List of maps of ingress rules to set on the security group"
  type        = list(map(string))
  default     = null
}

variable "security_group_name" {
  type = string
}

variable "description" {
  type = string
}