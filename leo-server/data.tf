# find vpc id
data "aws_vpc" "tf-vpc" {
  id = "vpc-086a1a6d756141dc0"
}

# find public subnet 
data "aws_subnet" "tf-public-subnet-1" {
  id = "subnet-097fefab55c835105"
}

data "aws_subnet" "tf-public-subnet-2" {
  id = "subnet-081f76bf7b01c1309"
}

# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "amazon-issued-cert" {
  domain      = "*.test.devopsbootcamp.link"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

# # ec2 security group
# data "aws_security_groups" "rds_sg" {}


# #route 53 hosted zone
# data "aws_route53_zone" "test-devopsbootcamp" {
#   name         = "test.devopsbootcamp.link"
#   private_zone = false
# }

# # cloud init config 
# data "cloudinit_config" "userdata-php" {
#   gzip          = true
#   base64_encode = true

#   # part to call tpl file
#   part {
#     content_type = "text/x-shellscript"
#     filename     = "userdata"
#     content      = templatefile("templates/userdata.tpl", {})
#   }

# }



# data "aws_s3_bucket" "tf-leo-bucket" {
#   bucket = aws_s3_bucket.tf-leo-bucket.bucket
# }