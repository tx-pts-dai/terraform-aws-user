output "user_arn" {
  description = "ARN of the AWS IAM user"
  value       = aws_iam_user.this.arn
}

output "secret_arn" {
  description = "ARN of the secret with user access keys"
  value       = aws_secretsmanager_secret.this.arn
}

output "info_to_rotate" {
  description = "how to rotate access key"
  value       = "run 'terraform taint module.<...>.aws_iam_access_key.this' to rotate the access key"
}
