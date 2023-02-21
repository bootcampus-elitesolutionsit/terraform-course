resource "random_password" "password" {
  length           = 20
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "secrets" {
  name                    = "phpdemo"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secrets.id
  secret_string = random_password.password.result
}
