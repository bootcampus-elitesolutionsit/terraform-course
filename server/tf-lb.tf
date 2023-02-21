resource "aws_lb" "loadbalancer" {
  name               = lower(join("-", [local.application_tags.Application, "demolb"]))
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.ec2_sg.id, data.aws_security_group.lb_sg.id]
  subnets            = [data.aws_subnet.Public_subnet_1.id, data.aws_subnet.Public_subnet_2.id]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.loadbalancer_s3.bucket
    prefix  = "php-lb"
    enabled = false
  }

  tags = merge({ Name = "php-demolb", Env = "dev" }, var.tags, local.application_tags)

  depends_on = [
    aws_s3_bucket.loadbalancer_s3,
  ]
}

resource "aws_lb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.port
  protocol = var.protocol
  vpc_id   = data.aws_vpc.vpc_id.id

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

resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.demo_server.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
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

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = local.record_name
  type    = "A"

  alias {
    name                   = aws_lb.loadbalancer.dns_name
    zone_id                = aws_lb.loadbalancer.zone_id
    evaluate_target_health = true
  }
}