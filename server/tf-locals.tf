locals {
  common_tags = {
    Company = "Tech Starter republic"
    Owner   = "Elitesolutionsit"
    github  = "https://github.com/bootcampus-elitesolutionsit/terraform-course"
  }

  network_tags = {
    Company = "Tech Starter republic"
    Owner   = "Elitesolutionsit"
    github  = "https://github.com/bootcampus-elitesolutionsit/terraform-course"
  }

  application_tags = {
    Company     = "Tech Starter republic"
    Owner       = "Elitesolutionsit"
    github      = "https://github.com/bootcampus-elitesolutionsit/terraform-course"
    Application = "PHP"
  }

  Public_subnet_1 = "subnet-03b5cd0501f7625e5"
  Public_subnet_2 = "subnet-0854544b1d04dc5c8"
  ec2_sg          = "sg-0b047ff81e3615ec3"
  lb_sg           = "sg-07077757a898c8143"
  vpc_id          = "vpc-0db706cdc14b55f5d"
  bucket_name     = "phploadbancerstorageuxcv"
  bucket_acl      = "private"
}