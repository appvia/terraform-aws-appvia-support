# Module: AWS Cost Analysis Support

This module provisions the IAM resources required for Appvia to support the CUDOS (Cloud Intelligence Dashboards on AWS) platform and cost reporting tooling. It is intended to be deployed into the **Cost Analysis account** where CUDOS dashboards and CUR data are hosted.

## Resources Created

| Resource | Name | Purpose |
|----------|------|---------|
| `aws_iam_role` | `AppviaCostAnalysisSupportRole` | Cross-account role assumed by Appvia's support team |
| `aws_iam_policy` | `AppviaCudosSupportPolicy` | Grants the permissions required to manage and troubleshoot the CUDOS platform |

The trust policy on `AppviaCostAnalysisSupportRole` allows assumption only from a specific Appvia-managed SSO role in the Appvia AWS account (`148761643183` by default), scoped by region.

## Permissions Granted

The `AppviaCudosSupportPolicy` policy grants access to:

- **QuickSight** — view and manage analyses, dashboards, datasets, and data sources
- **Athena** — full access for running CID/CUDOS queries
- **Glue** — read access and the ability to update tables used by the dashboards
- **S3** — list and read access to `cid-*`, `cudos-dashboard-*`, and `aws-athena-query-results-cid-*` buckets, plus write access for Athena query results
- **Step Functions** — view and trigger executions for CUDOS data refresh workflows
- **Lambda** — read access to functions used by CID/CUDOS
- **CloudWatch** — read access to `/aws/lambda/CID-DC*` log groups and CloudWatch alarms

## Usage

```hcl
module "cost_analysis_support" {
  source = "../../modules/costanalysis"

  tags = { Environment = "production" }
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cudos_policy_name"></a> [cudos\_policy\_name](#input\_cudos\_policy\_name) | Customer managed support policy for dashboards | `string` | `"AppviaCudosSupportPolicy"` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | `"148761643183"` | no |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_external_role_name"></a> [external\_role\_name](#input\_external\_role\_name) | The external account name from where the support role will be assumed | `string` | `"AWSReservedSSO_LandingZoneSupport_bed6bf8641dc41f3"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cost_analysis_support_role_arn"></a> [cost\_analysis\_support\_role\_arn](#output\_cost\_analysis\_support\_role\_arn) | The ARN of the IAM role to be assumed by the support team |
<!-- END_TF_DOCS -->