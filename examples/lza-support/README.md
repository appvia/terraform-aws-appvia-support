<!-- BEGIN_TF_DOCS -->
# Example: AWS Landing Zone Accelerator Support

This example demonstrates how to deploy the AWS Landing Zone Accelerator (LZA) support resources using Terraform in your AWS Management Account where Control Tower is configured.

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
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appvia_cost_analysis_support_role_arn"></a> [appvia\_cost\_analysis\_support\_role\_arn](#output\_appvia\_cost\_analysis\_support\_role\_arn) | The ARN of the IAM role to be assumed by the support team for cost analysis |
| <a name="output_appvia_landing_zone_support_role_arn"></a> [appvia\_landing\_zone\_support\_role\_arn](#output\_appvia\_landing\_zone\_support\_role\_arn) | The name of the Landing Zone Support IAM role to be assumed by the Appvia support team |
<!-- END_TF_DOCS -->