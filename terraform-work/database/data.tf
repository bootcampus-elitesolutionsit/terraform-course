data "aws_secretsmanager_random_password" "randompass" {
  password_length    = 10
  exclude_numbers    = true
  exclude_characters = true
}

