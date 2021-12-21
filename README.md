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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Authors

Module managed by [Nick Hammond](https://github.com/nhammond101) on behalf of the Waracle team

Please reach out to [Waracle](https://waracle.com) if you are looking to build enterprise applications, especially in highly regulated industries.

## License

MIT Licensed. See [LICENSE](https://github.com/waracle/tf-postman/tree/main/LICENSE) for full details.

---

[Cognito]: https://aws.amazon.com/cognito/
[Postman]: https://www.postman.com/

