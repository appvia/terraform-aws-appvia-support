<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cudos_policy_name"></a> [cudos\_policy\_name](#input\_cudos\_policy\_name) | Customer managed support policy for dashboards | `string` | `"AppviaCudosSupportPolicy"` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | `"730335310409"` | no |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_external_role_name"></a> [external\_role\_name](#input\_external\_role\_name) | The external account name from where the support role will be assumed | `string` | `"AWSReservedSSO_LZASupport_ece287516c084d4f"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cost_analysis_support_role_arn"></a> [cost\_analysis\_support\_role\_arn](#output\_cost\_analysis\_support\_role\_arn) | The ARN of the IAM role to be assumed by the support team |
<!-- END_TF_DOCS -->