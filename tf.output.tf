output "public_ip" {
  value = aws_instance.project_server.public_ip
}

output "arn" {
  value = aws_instance.project_server.arn
}