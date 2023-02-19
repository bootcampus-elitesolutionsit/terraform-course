resource "aws_secretsmanager_secret" "secrets" {
  name = "phpsecrets"
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secrets.id
  secret_string = jsonencode(var.db_secrets)
}
