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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appvia_cost_analysis_support_role"></a> [appvia\_cost\_analysis\_support\_role](#module\_appvia\_cost\_analysis\_support\_role) | ../../modules/costanalysis | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appvia_cost_analysis_support_role_arn"></a> [appvia\_cost\_analysis\_support\_role\_arn](#output\_appvia\_cost\_analysis\_support\_role\_arn) | The name of the Cost Analysis Support IAM role to be assumed by the Appvia support team |
<!-- END_TF_DOCS -->

