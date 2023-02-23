locals {
  # Common tags to be assigned to php resource
  common_tags = {
    Name = "php-server"
    Env  = "test"
  }
  #network tags for all vpc services
  Network_tags = {
    Name = "tf-vpc"
    Env  = "test"
  }

  # company never changing tags
  company_tags = {
    Name   = "TSRBootcamp"
    Github = "https://github.com/bootcampus-elitesolutionsit/terraform-course.git"
  }
}

