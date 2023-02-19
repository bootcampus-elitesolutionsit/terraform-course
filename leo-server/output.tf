# output the server pubplic ip
output "public_ip" {
  value       = aws_instance.php-server.public_ip
  description = "show public ip when apply"

}

# output 
output "zone_name" {
  value       = aws_route53_record.tf_domain.name
  description = "show dns name server when apply"

}