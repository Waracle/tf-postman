output "user_arn" {
  value = aws_iam_user.cognito_user.arn
}

output "user_name" {
  value = aws_iam_user.cognito_user.name
}

output "access_key_id" {
  value = aws_iam_access_key.cognito_user_key.id
}

output "access_key_secret" {
  sensitive = true
  value = aws_iam_access_key.cognito_user_key.secret
}
