module "vpc" {
  source                  = "./module-demo/vpc"
  name                    = "my-vpc"
  cidr_block              = "10.0.0.0/16"
  enable_dns_support      = true
  instance_tenancy        = "default"
  public_subnets          = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19", "10.0.96.0/19"]
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
