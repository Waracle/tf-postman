# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------
variable "cognito_user_pool_arn" {
  description = "The ARN of the User Pool to grant the Postman user access to"
  type        = string
}

variable "username" {
  description = "[Optional] The username to assign to the IAM user to be created"
  default     = "postman-user"
  type        = string
}
