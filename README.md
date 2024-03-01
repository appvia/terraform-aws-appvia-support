## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |
| <a name="provider_aws.cudos"></a> [aws.cudos](#provider\_aws.cudos) | 5.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cudos_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.landing_zone_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cudos_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.support_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cost_analysis_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.custom_cudos_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.landing_zone_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.managed_cudos_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cudos_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.landing_zone_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_accounts"></a> [aws\_accounts](#input\_aws\_accounts) | A map of the name at the account id | `map(string)` | `{}` | no |
| <a name="input_cost_analysis_role_name"></a> [cost\_analysis\_role\_name](#input\_cost\_analysis\_role\_name) | The name of the role used to support the cudos dashboards | `string` | `"CostAnalysisSupportRole"` | no |
| <a name="input_costs_analysis_policy_name"></a> [costs\_analysis\_policy\_name](#input\_costs\_analysis\_policy\_name) | Customer managed support policy for cost analysis | `string` | `"CostAnalysisSupportPolicy"` | no |
| <a name="input_cudos_policy_name"></a> [cudos\_policy\_name](#input\_cudos\_policy\_name) | Customer managed support policy for dashboards | `string` | `"CudosSupportPolicy"` | no |
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `false` | no |
| <a name="input_enable_landing_zone_support"></a> [enable\_landing\_zone\_support](#input\_enable\_landing\_zone\_support) | Enable the creation of the support role in the customer account | `bool` | `true` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_external_role_name"></a> [external\_role\_name](#input\_external\_role\_name) | The external account name from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_landing_zone_policy_name"></a> [landing\_zone\_policy\_name](#input\_landing\_zone\_policy\_name) | Customer managed support policy for landing zone | `string` | `"LZASupportPolicy"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region where to deploy the resources | `string` | n/a | yes |
| <a name="input_support_role_name"></a> [support\_role\_name](#input\_support\_role\_name) | The name of the role created in the customer account | `string` | `"LZASupportRole"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cudos_account_id"></a> [cudos\_account\_id](#output\_cudos\_account\_id) | The account id of the cudos account |
| <a name="output_cudos_support_arn"></a> [cudos\_support\_arn](#output\_cudos\_support\_arn) | The ARN of the IAM role to be assumed by the support team for cudos |
| <a name="output_landing_support_arn"></a> [landing\_support\_arn](#output\_landing\_support\_arn) | The name of the IAM role to be assumed by the support team |
| <a name="output_management_account_id"></a> [management\_account\_id](#output\_management\_account\_id) | The account id of the management account |
