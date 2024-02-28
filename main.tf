terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_iam_user" "this" {
  name = var.username
  path = "/"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  name   = var.policy_name
  user   = aws_iam_user.this.name
  policy = var.policy_json
}

resource "aws_secretsmanager_secret" "this" {
  name        = var.secret_name
  description = "Access keys of the ${aws_iam_user.this.name} IAM User"
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id
  secret_string = jsonencode({
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.this.id
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.this.secret
  })
}
