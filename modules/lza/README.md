<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lza_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cost_analysis_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lza_support_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cost_analysis_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lza_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.landing_zone_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cost_analysis_policy_name"></a> [cost\_analysis\_policy\_name](#input\_cost\_analysis\_policy\_name) | Customer managed support policy for cost analysis | `string` | `"AppviaCostAnalysisSupportPolicy"` | no |
| <a name="input_enable_codecommit_support"></a> [enable\_codecommit\_support](#input\_enable\_codecommit\_support) | When the accelerator config is still in codecommit, we need permissions to raise changes only | `bool` | `false` | no |
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `false` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_external_costanalysis_role_name"></a> [external\_costanalysis\_role\_name](#input\_external\_costanalysis\_role\_name) | The external account name from where the support role will be assumed | `string` | `""` | no |
| <a name="input_external_lza_role_name"></a> [external\_lza\_role\_name](#input\_external\_lza\_role\_name) | The external account name from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_landing_zone_policy_name"></a> [landing\_zone\_policy\_name](#input\_landing\_zone\_policy\_name) | Customer managed support policy for landing zone | `string` | `"AppviaLZASupportPolicy"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cost_analysis_support_role_arn"></a> [cost\_analysis\_support\_role\_arn](#output\_cost\_analysis\_support\_role\_arn) | The ARN of the IAM role to be assumed by the support team for cost analysis |
| <a name="output_landing_support_role_arn"></a> [landing\_support\_role\_arn](#output\_landing\_support\_role\_arn) | The name of the IAM role to be assumed by the support team |
<!-- END_TF_DOCS -->