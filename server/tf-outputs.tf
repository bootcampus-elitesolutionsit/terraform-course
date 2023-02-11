output "public_ip" {
  value = aws_instance.demo_server.public_ip
}

output "arn" {
  value = aws_instance.demo_server.arn
}