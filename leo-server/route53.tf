# resource "aws_route53_record" "CNAME" {
#   zone_id = data.aws_route53_zone.test-devopsbootcamp.zone_id
#   name    = "www.${data.aws_route53_zone.test-devopsbootcamp.name}"
#   type    = "CNAME"
#   ttl     = "300"
#   records = ["ns-214.awsdns-26.com",
#     "ns-598.awsdns-10.net",
#     "ns-1161.awsdns-17.org",
#   "ns-1928.awsdns-49.co.uk", ]

# }


# get hosted zone details
# terraform aws data hosted zone
data "aws_route53_zone" "hosted_zone" {
  name         = var.domain_name
  private_zone = false
}

# create a record set in route 53
# terraform aws route 53 record
resource "aws_route53_record" "tf_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = aws_lb.loadbalancer.dns_name
    zone_id                = aws_lb.loadbalancer.zone_id
    evaluate_target_health = true
  }
}