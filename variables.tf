variable "acl" {
  type        = string
  default     = "public-read"
  description = "s3 access control list, for owner to get full control and allowers get read only access"

}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "distroy even lock files in a bucket when destroying an s3 bucket"

}

variable "version-cong" {
  type        = string
  default     = "Disabled"
  description = "versioning config status "

}

