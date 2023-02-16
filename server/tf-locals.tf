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

  Public_subnet_1 = "subnet-0f6fff2d1dd4d97ce"
  Public_subnet_2 = "subnet-076751ed7c7c41461"
  ec2_sg          = "sg-009249e04fcc7cd88"
  bucket_name     = "phploadbancerstorageuxcv"
  bucket_acl      = "private"
}