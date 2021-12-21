output "user_arn" {
  description = "The ARN of the newly created user"
  value       = aws_iam_user.cognito_user.arn
}

output "user_name" {
  description = "The name of the newly created user"
  value       = aws_iam_user.cognito_user.name
}

output "access_key_id" {
  description = "The access key generated for the user"
  value       = aws_iam_access_key.cognito_user_key.id
}

output "access_key_secret" {
  description = "The secret access key generated for the user"
  sensitive   = true
  value       = aws_iam_access_key.cognito_user_key.secret
}
