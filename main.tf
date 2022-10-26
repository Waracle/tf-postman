# IAM Policy statements for accessing the API Gateways
data "aws_iam_policy_document" "api_policy_document" {
  statement {
    actions = [
      "apigateway:GET"
    ]

    effect = "Allow"

    resources = [
      "*"
    ]

  }

  version = "2012-10-17"
}

# IAM Policy statements for accessing the Cloudwatch metrics
data "aws_iam_policy_document" "cloudwatch_policy_document" {
  statement {
    actions = [
      "cloudwatch:GetMetricData",
      "cloudwatch:ListMetrics"
    ]

    effect = "Allow"

    resources = [
      "*"
    ]

  }

  version = "2012-10-17"
}

# IAM Policy statements for accessing the Cognito permissions
data "aws_iam_policy_document" "cognito_policy_document" {
  count = var.cognito_user_pool_arn != "" ? 1 : 0

  statement {
    actions = [
      "cognito-idp:AdminInitiateAuth"
    ]

    effect = "Allow"

    resources = [
      var.cognito_user_pool_arn
    ]

  }

  version = "2012-10-17"
}

# IAM Policy for accessing the API Gateways
resource "aws_iam_policy" "apigateway_policy" {
  policy = data.aws_iam_policy_document.api_policy_document.json
}

# IAM Policy for accessing the Cloudwatch
resource "aws_iam_policy" "cloudwatch_policy" {
  policy = data.aws_iam_policy_document.cloudwatch_policy_document.json
}

# IAM Policy for accessing the Cognito userpools
resource "aws_iam_policy" "cognito_policy" {
  count  = var.cognito_user_pool_arn != "" ? 1 : 0
  policy = data.aws_iam_policy_document.cognito_policy_document[0].json
}

# Attach the API Gateway policy to the User
resource "aws_iam_user_policy_attachment" "apigateway_user_policy_attachment" {
  policy_arn = aws_iam_policy.apigateway_policy.arn
  user       = aws_iam_user.user.name
}

# Attach the Cloudwatch policy to the User
resource "aws_iam_user_policy_attachment" "cloudwatch_user_policy_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
  user       = aws_iam_user.user.name
}

# Attach the Cognito policy to the User
resource "aws_iam_user_policy_attachment" "cognito_user_policy_attachment" {
  count      = var.cognito_user_pool_arn != "" ? 1 : 0
  policy_arn = aws_iam_policy.cognito_policy[0].arn
  user       = aws_iam_user.user.name
}

# Create an IAM user
resource "aws_iam_user" "user" {
  name = var.username
  path = "/"
}

# Create programmatic access for the IAM user
resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.user.name
}
