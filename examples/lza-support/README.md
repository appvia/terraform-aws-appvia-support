# Example: AWS Landing Zone Accelerator Support

This example demonstrates how to deploy the AWS Landing Zone Accelerator (LZA) support resources using Terraform in your AWS Management Account where Control Tower is configured.

The module provisions the following in your management account:

- **`AppviaLZASupportRole`** — an IAM role that Appvia's support team can assume (via a cross-account trust policy) to manage and troubleshoot the LZA pipeline. It grants read access to CodePipeline, CloudFormation, CodeBuild, and CodeCommit, with the ability to trigger the `AWSAccelerator-Pipeline`, and limited write access to the `aws-accelerator-config` CodeCommit repository.
- **`AppviaLZASupportPolicy`** — a customer-managed IAM policy attached to the support role containing the above permissions.
- **`AppviaCostAnalysisSupportPolicy`** *(optional)* — an additional policy attached to the support role granting read access to Cost Explorer, AWS Billing, Cost Optimization Hub, and Carbon Footprint data. Enabled via `enable_cost_analysis_support = true`.

The trust policy on the support role allows assumption only from a specific Appvia-managed IAM role in the Appvia AWS account (`755035180280` by default), scoped to an SSO role ARN.

## Deployment

1. Copy the `terraform.tfvars.sample` file to `terraform.tfvars` and update with your values.
2. Run `terraform init -upgrade`
3. Run `terraform plan -out=tfplan`
4. Run `terraform apply tfplan`

## Updating Docs

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:

1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

<!-- BEGIN_TF_DOCS -->
## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appvia_landing_zone_support_role_arn"></a> [appvia\_landing\_zone\_support\_role\_arn](#output\_appvia\_landing\_zone\_support\_role\_arn) | The name of the Landing Zone Support IAM role to be assumed by the Appvia support team |
<!-- END_TF_DOCS -->

