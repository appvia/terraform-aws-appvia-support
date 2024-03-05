<!-- BEGIN_TF_DOCS -->
# Appvia Support Roles

This module creates IAM resources using Terraform in your AWS Account for Appvia to be able to provide remote support.

## Deployment

View the examples directory for a sample deployment.

## Updating Docs

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:
1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cost_analysis_role_name"></a> [cost\_analysis\_role\_name](#input\_cost\_analysis\_role\_name) | The name of the role used to support the cudos dashboards | `string` | `"AppviaCostAnalysisSupportRole"` | no |
| <a name="input_costs_analysis_policy_name"></a> [costs\_analysis\_policy\_name](#input\_costs\_analysis\_policy\_name) | Customer managed support policy for cost analysis | `string` | `"AppviaCostAnalysisSupportPolicy"` | no |
| <a name="input_cudos_policy_name"></a> [cudos\_policy\_name](#input\_cudos\_policy\_name) | Customer managed support policy for dashboards | `string` | `"AppviaCudosSupportPolicy"` | no |
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `false` | no |
| <a name="input_enable_landing_zone_support"></a> [enable\_landing\_zone\_support](#input\_enable\_landing\_zone\_support) | Enable the creation of the support role in the customer account | `bool` | `true` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_external_role_name"></a> [external\_role\_name](#input\_external\_role\_name) | The external account name from where the support role will be assumed | `string` | n/a | yes |
| <a name="input_landing_zone_policy_name"></a> [landing\_zone\_policy\_name](#input\_landing\_zone\_policy\_name) | Customer managed support policy for landing zone | `string` | `"AppviaSupportPolicy"` | no |
| <a name="input_support_role_name"></a> [support\_role\_name](#input\_support\_role\_name) | The name of the role created in the customer account | `string` | `"AppviaSupportRole"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cudos_support_arn"></a> [cudos\_support\_arn](#output\_cudos\_support\_arn) | The ARN of the IAM role to be assumed by the support team for cudos |
| <a name="output_landing_support_arn"></a> [landing\_support\_arn](#output\_landing\_support\_arn) | The name of the IAM role to be assumed by the support team |
<!-- END_TF_DOCS -->