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
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.dominicfilm.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}