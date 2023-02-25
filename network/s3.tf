resource "aws_s3_bucket" "cruise_bucket" {
  bucket = "cruise-bucket-name"

  tags = {
    Name        = "cruise-bucket"
    Environment = "Dev"

  }
}