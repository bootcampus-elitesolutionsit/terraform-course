resource "aws_lb" "application_load_balancer" {
  name               = "demoapp-alb"
  internal           = false 
  load_balancer_type = "application" 
  subnet_id = aws_subnet.public_subnet1.id
  ecurity_groups = aws_security_group.alb_security_group.id
  enable_deletion_protection = false

  tags = {
   name   = demoapp-alb
  }
}

resource "aws_lb_target_group" "server-group" {
  name        = "demoapp-alb"
  port        = 80 
  protocol    = "HTTP" 
  vpc_id      = "aws_vpc.myvpc.id"
  target_type = "ip" 

  health_check {
    interval            = 300
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 60
    matcher             = 200
    unhealthy_threshold = 5
    healthy_threshold = 5
  }

  tags = {
  name   = "demoapp-alb"
  }
}

resource "aws_lb_listener" "alb_http_listener" {
load_balancer_arn = aws_lb.application_load_balancer.arn
port              = 80
protocol          = "HTTP"

default_action {
 type = "redirect"

 redirect { 
    port  = 443
    protocol = "HTTPS"
    status_code = "HTTP_301"
  }
 }
}

resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}


resource "aws_lb_target_group" "data_target_group" {


  name        = "data-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "aws_vpc.myvpc.id"
  
  }

 
 resource "aws_lb_target_group_attachment" "attach" {
  target_group_arn = aws_lb_target_group.data_target_group.arn
  target_id        = aws_instance.ansible-server.id
  port             = 80
}
 
 
  health_check {
    path     = "/health"
    interval = 30
  }
  }
  
