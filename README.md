# Terraform Postman Module

Supports the creation of the required IAM user and credentials for [Postman] collections runs that required AWS [Cognito] authentication

## How to use

```terraform
# -----------------------------------------------------------------------------
# Postman
# -----------------------------------------------------------------------------
module "postman" {
  source                = "github.com/waracle/tf-postman?ref=v1.0.0"
  cognito_user_pool_arn = "arn:aws:cognito-idp:us-east-1:123412341234:userpool/us-east-1_123412341"
}

# This is the access key to access Cognito with
output "postman_access_key" {
  value = module.postman.access_key_id
}
# This is the secret access key to access Cognito with
output "postman_access_key_secret" {
  value = module.postman.access_key_secret
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.27 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.user_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.apigateway_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cognito_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.apigateway_user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.cloudwatch_user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.cognito_user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy_document.api_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudwatch_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cognito_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cognito_user_pool_arn"></a> [cognito\_user\_pool\_arn](#input\_cognito\_user\_pool\_arn) | [Optional] The ARN of the User Pool to grant the Postman user access to | `string` | `""` | no |
| <a name="input_username"></a> [username](#input\_username) | [Optional] The username to assign to the IAM user to be created | `string` | `"postman-user"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_id"></a> [access\_key\_id](#output\_access\_key\_id) | The access key generated for the user |
| <a name="output_access_key_secret"></a> [access\_key\_secret](#output\_access\_key\_secret) | The secret access key generated for the user |
| <a name="output_user_arn"></a> [user\_arn](#output\_user\_arn) | The ARN of the newly created user |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | The name of the newly created user |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Authors

Module managed by [Nick Hammond](https://github.com/nhammond101) on behalf of the Waracle team

Please reach out to [Waracle](https://waracle.com) if you are looking to build enterprise applications, especially in highly regulated industries.

## License

MIT Licensed. See [LICENSE](https://github.com/waracle/tf-postman/tree/main/LICENSE) for full details.

---

[Cognito]: https://aws.amazon.com/cognito/
[Postman]: https://www.postman.com/

