# Vpc Variables
variable "enable_dns_support" {
  description = "Defaults to false. But can be Overide using this variable `enable_dns_support`"
  type        = bool
  default     = true
}