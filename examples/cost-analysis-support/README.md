# Example: AWS Cost Analysis Support

This example demonstrates how to deploy the AWS Cost Analysis support resources using Terraform in your AWS Cost Analysis Account.

## Deployment

1. Copy the `terraform.tfvars.example` file to `terraform.tfvars` and update with your values.
2. Run `terraform init -upgrade`
3. Run `terraform plan -out=tfplan`
4. Run `terraform apply tfplan`

## Updating Docs

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:

1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

## Inputs

| Name                                                                                                                  | Description                                                           | Type          | Default       | Required |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- | ------------- | ------------- | :------: |
| <a name="input_enable_cost_analysis_support"></a> [enable_cost_analysis_support](#input_enable_cost_analysis_support) | Enable the creation of the finops role in the customer account        | `bool`        | `true`        |    no    |
| <a name="input_enable_landing_zone_support"></a> [enable_landing_zone_support](#input_enable_landing_zone_support)    | Enable the creation of the support role in the customer account       | `bool`        | `false`       |    no    |
| <a name="input_external_account_id"></a> [external_account_id](#input_external_account_id)                            | The external account id from where the support role will be assumed   | `string`      | n/a           |   yes    |
| <a name="input_external_region"></a> [external_region](#input_external_region)                                        | The external region from where the support role will be assumed       | `string`      | `"eu-west-2"` |    no    |
| <a name="input_external_role_name"></a> [external_role_name](#input_external_role_name)                               | The external account name from where the support role will be assumed | `string`      | n/a           |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                         | A map of tags to add to the resources                                 | `map(string)` | `{}`          |    no    |

## Outputs

| Name                                                                                                                                               | Description                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| <a name="output_appvia_cost_analysis_support_role_arn"></a> [appvia_cost_analysis_support_role_arn](#output_appvia_cost_analysis_support_role_arn) | The name of the Cost Analysis Support IAM role to be assumed by the Appvia support team |

<!-- BEGIN_TF_DOCS -->
# Example: AWS Cost Analysis Support

This example demonstrates how to deploy the AWS Cost Analysis support resources using Terraform in your AWS Cost Analysis Account.

## Deployment

1. Copy the `terraform.tfvars.example` file to `terraform.tfvars` and update with your values.
2. Run `terraform init -upgrade`
3. Run `terraform plan -out=tfplan`
4. Run `terraform apply tfplan`

## Updating Docs

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:
1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appvia_cost_analysis_support_role_arn"></a> [appvia\_cost\_analysis\_support\_role\_arn](#output\_appvia\_cost\_analysis\_support\_role\_arn) | The name of the Cost Analysis Support IAM role to be assumed by the Appvia support team |
<!-- END_TF_DOCS -->