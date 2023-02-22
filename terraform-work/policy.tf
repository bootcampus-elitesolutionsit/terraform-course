resource "aws_s3_bucket_policy" "allow_access_from_lb" {
  bucket = aws_s3_bucket.terra-bkt.id
  policy = data.aws_iam_policy_document.allow_access_from_lb.json
}

data "aws_iam_policy_document" "allow_access_from_lb" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["375866976303"]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
    ]

    resources = [
      aws_s3_bucket.terra-bkt.arn,
      "${aws_s3_bucket.terra-bkt.arn}/*",
    ]
  }
}