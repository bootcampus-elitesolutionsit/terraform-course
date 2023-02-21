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
    Company = "Tech Starter republic"
    Owner   = "Elitesolutionsit"
    github  = "https://github.com/bootcampus-elitesolutionsit/terraform-course"
  }

  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"
}