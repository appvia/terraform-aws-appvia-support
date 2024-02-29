## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 5.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.38.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_policy.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                  | resource    |
| [aws_iam_policy.landing_zone_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                   | resource    |
| [aws_iam_role.support_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                              | resource    |
| [aws_iam_role_policy_attachment.finops_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)       | resource    |
| [aws_iam_role_policy_attachment.landing_zone_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                                  | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)               | data source |
| [aws_iam_policy_document.cost_analysis_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)             | data source |
| [aws_iam_policy_document.landing_zone_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)              | data source |

## Inputs

| Name                                                                                                                  | Description                                                           | Type          | Default                       | Required |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ------------- | ----------------------------- | :------: |
| <a name="input_costs_analysis_policy_name"></a> [costs_analysis_policy_name](#input_costs_analysis_policy_name)       | Customer managed support policy for cost analysis                     | `string`      | `"CostAnalysisSupportPolicy"` |    no    |
| <a name="input_enable_cost_analysis_support"></a> [enable_cost_analysis_support](#input_enable_cost_analysis_support) | Enable the creation of the finops role in the customer account        | `bool`        | `false`                       |    no    |
| <a name="input_enable_landing_zone_support"></a> [enable_landing_zone_support](#input_enable_landing_zone_support)    | Enable the creation of the support role in the customer account       | `bool`        | `true`                        |    no    |
| <a name="input_external_account_id"></a> [external_account_id](#input_external_account_id)                            | The external account id from where the support role will be assumed   | `string`      | n/a                           |   yes    |
| <a name="input_external_region"></a> [external_region](#input_external_region)                                        | The external region from where the support role will be assumed       | `string`      | `"eu-west-2"`                 |    no    |
| <a name="input_external_role_name"></a> [external_role_name](#input_external_role_name)                               | The external account name from where the support role will be assumed | `string`      | n/a                           |   yes    |
| <a name="input_landing_zone_policy_name"></a> [landing_zone_policy_name](#input_landing_zone_policy_name)             | Customer managed support policy for landing zone                      | `string`      | `"LZASupportPolicy"`          |    no    |
| <a name="input_region"></a> [region](#input_region)                                                                   | The AWS region where to deploy the resources                          | `string`      | n/a                           |   yes    |
| <a name="input_support_role_name"></a> [support_role_name](#input_support_role_name)                                  | The name of the role created in the customer account                  | `string`      | `"LZASupportRole"`            |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                         | A map of tags to add to the resources                                 | `map(string)` | `{}`                          |    no    |

## Outputs

| Name                                                                                                        | Description                                                  |
| ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| <a name="output_cost_analysis_policy_arn"></a> [cost_analysis_policy_arn](#output_cost_analysis_policy_arn) | The ARN of the IAM policy to be attached to the support role |
| <a name="output_landing_zone_policy_arn"></a> [landing_zone_policy_arn](#output_landing_zone_policy_arn)    | The ARN of the IAM policy to be attached to the support role |
| <a name="output_support_role_arn"></a> [support_role_arn](#output_support_role_arn)                         | The ARN of the IAM role to be assumed by the support team    |
| <a name="output_support_role_name"></a> [support_role_name](#output_support_role_name)                      | The name of the IAM role to be assumed by the support team   |
