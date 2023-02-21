# S3 bucket
resource "aws_s3_bucket" "tf-leo-bucket" {
  bucket        = "tf-leo-bucket"
  force_destroy = var.force_destroy

  tags = {
    Name = "tf-leo-bucket"
    Env  = "test"
  }
}

resource "aws_s3_bucket_acl" "tf-s3-bucket-acl" {
  bucket = aws_s3_bucket.tf-leo-bucket.id
  acl    = var.acl

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf-leo-bucket.id
  versioning_configuration {
    status = var.version-cong
  }
}

