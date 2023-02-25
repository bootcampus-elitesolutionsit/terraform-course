resource "aws_s3_bucket" "world_bucket" {
  bucket = "cruise-bucket-name"

  tags = {
    Name        = "world-bucket"
    Environment = "Dev"

  }
}