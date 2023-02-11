data "aws_subnet" "Public_subnet" {
  id = "subnet-09fd99dbfa17c3e0a"
}

data "aws_security_group" "ec2_sg" {
  id = "sg-09de77d02431e300d"
}