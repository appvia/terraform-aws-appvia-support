# Example: AWS Cost Analysis Support

This example demonstrates how to deploy the AWS Cost Analysis support resources using Terraform in your **AWS Cost Analysis account** (where CUDOS dashboards and CUR data are hosted).

The module provisions the following:

- **`AppviaCostAnalysisSupportRole`** — a cross-account IAM role that Appvia's team can assume (via a trust policy scoped to Appvia's SSO role in account `148761643183`) to support the CUDOS platform and cost reporting tooling.
- **`AppviaCudosSupportPolicy`** — a customer-managed IAM policy granting access to:
  - **QuickSight** — view and manage analyses, dashboards, datasets, and data sources
  - **Athena** — full access for running CID/CUDOS queries
  - **Glue** — read access and the ability to update tables used by the dashboards
  - **S3** — list and read access to `cid-*`, `cudos-dashboard-*`, and `aws-athena-query-results-cid-*` buckets, plus write access for Athena query results
  - **Step Functions** — view and trigger executions for CUDOS data refresh workflows
  - **Lambda** — read access to functions used by CID/CUDOS
  - **CloudWatch Logs** — read access to `/aws/lambda/CID-DC*` log groups and CloudWatch alarms

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
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appvia_cost_analysis_support_role_arn"></a> [appvia\_cost\_analysis\_support\_role\_arn](#output\_appvia\_cost\_analysis\_support\_role\_arn) | The name of the Cost Analysis Support IAM role to be assumed by the Appvia support team |
<!-- END_TF_DOCS -->
