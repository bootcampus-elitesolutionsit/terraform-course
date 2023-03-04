resource "aws_secretsmanager_secret" "user_data" {
  name                    = "userdata-string"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "user_data" {
  secret_id     = aws_secretsmanager_secret.user_data.id
  secret_string = var.user_data
}