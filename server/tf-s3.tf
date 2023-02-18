resource "aws_s3_bucket" "loadbalancer_s3" {
  bucket = local.bucket_name

  tags = merge({ Name = "phploadbancerstorageuxcv", Env = "dev" }, var.tags, local.application_tags)
}

resource "aws_s3_bucket_acl" "loadbalancer_s3_acl" {
  bucket = aws_s3_bucket.loadbalancer_s3.id
  acl    = local.bucket_acl
}

resource "aws_s3_bucket_policy" "allow_access_from_lb" {
  bucket = aws_s3_bucket.loadbalancer_s3.id
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
      aws_s3_bucket.loadbalancer_s3.arn,
      "${aws_s3_bucket.loadbalancer_s3.arn}/*",
    ]
  }
  depends_on = [
    aws_s3_bucket.loadbalancer_s3
  ]
}

