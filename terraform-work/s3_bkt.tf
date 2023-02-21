resource "aws_s3_bucket" "terra-bkt" {
  bucket = "terra-bkt"

  tags = {
    Name        = "terra-bkt"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.terra-bkt.id
  acl    = "private"
}