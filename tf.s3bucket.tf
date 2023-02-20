resource "aws_s3_bucket" "nikky-tf-bucket" {
  bucket = "nikky-tf-bucket"

  tags = {
    Name        = "nikky-tf-s3-bucket"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.nikky-tf-bucket.id
  acl    = "private"
}
