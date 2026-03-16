# Module: AWS Landing Zone Accelerator (LZA) Support

This module provisions the IAM resources required for Appvia to support your AWS Landing Zone Accelerator deployment. It is intended to be deployed into the **management account** where Control Tower and the LZA pipeline are configured.

## Resources Created

| Resource | Name | Purpose |
|----------|------|---------|
| `aws_iam_role` | `AppviaLZASupportRole` | Cross-account role assumed by Appvia's support team |
| `aws_iam_policy` | `AppviaLZASupportPolicy` | Grants permissions to view and trigger the LZA CodePipeline, inspect CloudFormation stacks, view CodeBuild logs, and manage the `aws-accelerator-config` CodeCommit repository |
| `aws_iam_policy` | `AppviaCostAnalysisSupportPolicy` | *(optional)* Grants read access to Cost Explorer, Billing, Cost Optimization Hub, and Carbon Footprint data |

The trust policy on `AppviaLZASupportRole` allows assumption only from a specific Appvia-managed SSO role in the Appvia AWS account (`755035180280` by default), scoped by region.

## Managed Policies Attached

The following AWS-managed policies are attached to `AppviaLZASupportRole`:

- `AWSOrganizationsReadOnlyAccess` — always attached
- `AWSBillingConductorReadOnlyAccess` — attached when `enable_cost_analysis_support = true`
- `AWSBillingReadOnlyAccess` — attached when `enable_cost_analysis_support = true`
- `CostOptimizationHubReadOnlyAccess` — attached when `enable_cost_analysis_support = true`

## CodeCommit Support

When `enable_codecommit_support = true`, the policy permits changes to the `aws-accelerator-config` CodeCommit repository while explicitly **denying** any direct pushes or merges to the `main` branch. When `false` (default), all `GitPush` and `CreateCommit` actions are denied entirely.

## Usage

```hcl
module "lza_support" {
  source = "../../modules/lza"

  enable_cost_analysis_support = true
  tags                         = { Environment = "production" }
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
| <a name="input_cost_analysis_policy_name"></a> [cost\_analysis\_policy\_name](#input\_cost\_analysis\_policy\_name) | Customer managed support policy for cost analysis | `string` | `"AppviaCostAnalysisSupportPolicy"` | no |
| <a name="input_enable_codecommit_support"></a> [enable\_codecommit\_support](#input\_enable\_codecommit\_support) | When the accelerator config is still in codecommit, we need permissions to raise changes only | `bool` | `false` | no |
| <a name="input_enable_cost_analysis_support"></a> [enable\_cost\_analysis\_support](#input\_enable\_cost\_analysis\_support) | Enable the creation of the finops role in the customer account | `bool` | `true` | no |
| <a name="input_external_account_id"></a> [external\_account\_id](#input\_external\_account\_id) | The external account id from where the support role will be assumed | `string` | `"148761643183"` | no |
| <a name="input_external_lza_role_name"></a> [external\_lza\_role\_name](#input\_external\_lza\_role\_name) | The external account name from where the support role will be assumed | `string` | `"AWSReservedSSO_LandingZoneSupport_bed6bf8641dc41f3"` | no |
| <a name="input_external_region"></a> [external\_region](#input\_external\_region) | The external region from where the support role will be assumed | `string` | `"eu-west-2"` | no |
| <a name="input_landing_zone_policy_name"></a> [landing\_zone\_policy\_name](#input\_landing\_zone\_policy\_name) | Customer managed support policy for landing zone | `string` | `"AppviaLZASupportPolicy"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_landing_support_role_arn"></a> [landing\_support\_role\_arn](#output\_landing\_support\_role\_arn) | The ARN of the IAM role to be assumed by the support team |
<!-- END_TF_DOCS -->