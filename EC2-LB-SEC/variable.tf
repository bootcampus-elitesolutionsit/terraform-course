variable "instance_type" {
    type = string
    default = 
    description = t2 free tier 
}



variable "ami" {
    type = string
    default = "ami-0735c191cf914754d"
    description = ubuntu id  for database server 
}


#s3 variable
variable "dominicfilm" {
    type = string
    default "my-tf-test-bucket"
}