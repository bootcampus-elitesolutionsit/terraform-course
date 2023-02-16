resource "aws_lb" "loadbalancer" {
  name               = lower(join("-", [local.application_tags.Application, "demolb"]))
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.ec2_sg.id]
  subnets            = [data.aws_subnet.Public_subnet_1.id, data.aws_subnet.Public_subnet_2.id]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.loadbalancer_s3.bucket
    prefix  = "php-lb"
    enabled = true
  }

  tags = merge({ Name = "php-demolb", Env = "dev" }, var.tags, local.application_tags)

  depends_on = [
    aws_s3_bucket.loadbalancer_s3,
    data.aws_iam_policy_document.allow_access_from_lb
  ]
}