resource "aws_s3_bucket" "dominicfilm" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "dominicfilm"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "dominicfilm" {
  bucket = aws_s3_bucket.dominicfilm.id
  acl    = "private"
}
