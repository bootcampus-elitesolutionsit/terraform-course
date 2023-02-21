# find vpc id
data "aws_vpc" "tf-vpc" {
  id = "vpc-0dc286ef7acf70e01"
}

# find public subnet 
data "aws_subnet" "tf-public-subnet-1" {
  id = "subnet-0f50b256d5eb55ba0"
}

data "aws_subnet" "tf-public-subnet-2" {
  id = "subnet-02a7567360583b9de"
}

# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "amazon-issued-cert" {
  domain      = "*.test.devopsbootcamp.link"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}


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