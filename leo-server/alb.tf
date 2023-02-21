# application load balancer 

resource "aws_lb" "loadbalancer" {
  name               = "tf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id, aws_security_group.ec2_sg.id]
  subnets            = [data.aws_subnet.tf-public-subnet-1.id, data.aws_subnet.tf-public-subnet-2.id]

  enable_deletion_protection = false

}

# ALB listeners

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_lb_listener" "forward" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-tg.arn
  }
}


#   access_logs {
#     bucket  = aws_s3_bucket.loadbalancer_s3.bucket
#     prefix  = "php-lb"
#     enabled = true
#   }

# #   tags = merge({ Name = "php-demolb", Env = "dev" }, var.tags, local.application_tags)

# #   depends_on = [
# #     aws_s3_bucket.loadbalancer_s3,
# #     data.aws_iam_policy_document.allow_access_from_lb
# #   ]
# # }


# # ALB target group for nginx

resource "aws_lb_target_group" "tf-tg" {
  name     = "tf-php-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.tf-vpc.id

  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = "5"
    unhealthy_threshold = "3"
    timeout             = "5"
    interval            = "30"
    matcher             = "200-299,403"


  }
}








# # target group attachment to php server
# resource "aws_lb_target_group_attachment" "tf-tg-attach" {
#   target_group_arn = aws_lb_target_group.tf-tg.arn
#   target_id        = aws_instance.php-server.id
#   port             = 80
# }



