resource "aws_s3_bucket" "dominicfilm101" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "dominicfilm101"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "dominicfilm101" {
  bucket = aws_s3_bucket.dominicfilm101.id
  acl    = "private"
}
