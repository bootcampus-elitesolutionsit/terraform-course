resource "aws_s3_bucket" "kokos3bk2022" {
  bucket = "kokos3bk2022"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "test_koko" {
  bucket       = aws_s3_bucket.kokos3bk2022.bucket
  key          = "kokotest12/"
  content_type = "application/x-directory"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "hello_world_file" {
  bucket       = aws_s3_bucket.kokos3bk2022.bucket
  key          = "kokotest12/koko_project.txt"
  content      = "KOKO project!"
  content_type = "text/plain"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
