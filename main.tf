
data "aws_iam_policy_document" "cognito_policy_document" {
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

resource "aws_iam_policy" "cognito_policy" {
  policy = data.aws_iam_policy_document.cognito_policy_document.json
}

resource "aws_iam_user_policy_attachment" "cognito_user_policy_attachment" {
  policy_arn = aws_iam_policy.cognito_policy.arn
  user       = aws_iam_user.cognito_user.name
}

resource "aws_iam_user" "cognito_user" {
  name = var.username
  path = "/"
}

resource "aws_iam_access_key" "cognito_user_key" {
  user = aws_iam_user.cognito_user.name
}
