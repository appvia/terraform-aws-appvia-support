<!-- markdownlint-disable -->
<a href="https://www.appvia.io/"><img src="https://github.com/appvia/terraform-aws-appvia-support/blob/main/appvia_banner.jpg?raw=true" alt="Appvia Banner"/></a><br/><p align="right"> <a href="https://registry.terraform.io/modules/appvia/appvia-support/aws/latest"><img src="https://img.shields.io/static/v1?label=APPVIA&message=Terraform%20Registry&color=191970&style=for-the-badge" alt="Terraform Registry"/></a></a> <a href="https://github.com/appvia/terraform-aws-appvia-support/releases/latest"><img src="https://img.shields.io/github/release/appvia/terraform-aws-appvia-support.svg?style=for-the-badge&color=006400" alt="Latest Release"/></a> <a href="https://appvia-community.slack.com/join/shared_invite/zt-1s7i7xy85-T155drryqU56emm09ojMVA#/shared-invite/email"><img src="https://img.shields.io/badge/Slack-Join%20Community-purple?style=for-the-badge&logo=slack" alt="Slack Community"/></a> <a href="https://github.com/appvia/terraform-aws-appvia-support/graphs/contributors"><img src="https://img.shields.io/github/contributors/appvia/terraform-aws-appvia-support.svg?style=for-the-badge&color=FF8C00" alt="Contributors"/></a>

<!-- markdownlint-restore -->
<!--
  ***** CAUTION: DO NOT EDIT ABOVE THIS LINE ******
-->

# Appvia Support Roles

This repository provides a collection of Terraform sub-modules used to provision the appropriate support roles and permissions within your AWS accounts. Each module is independently deployable and scoped to a specific support function.

## Modules

### [LZA Support](modules/lza/README.md)

Deploys into your **AWS management account** (where Control Tower and the Landing Zone Accelerator pipeline run). It provisions a cross-account IAM role that Appvia's support team can assume to monitor and troubleshoot the LZA deployment.

Key resources:
- `AppviaLZASupportRole` — cross-account role with a trust policy scoped to Appvia's SSO role
- `AppviaLZASupportPolicy` — grants view and trigger access to CodePipeline, CloudFormation, CodeBuild, and CodeCommit
- `AppviaCostAnalysisSupportPolicy` *(optional)* — grants read access to Cost Explorer, Billing, and Cost Optimization Hub; enabled via `enable_cost_analysis_support = true`

→ [Module README](modules/lza/README.md) · [Example](examples/lza-support/README.md)

---

### [Cost Analysis Support](modules/costanalysis/README.md)

Deploys into your **AWS Cost Analysis account** (where CUDOS dashboards and CUR data are hosted). It provisions a cross-account IAM role that Appvia's team can assume to support the CUDOS platform and cost reporting tooling.

Key resources:
- `AppviaCostAnalysisSupportRole` — cross-account role with a trust policy scoped to Appvia's SSO role
- `AppviaCudosSupportPolicy` — grants access to QuickSight, Athena, Glue, S3 (CID/CUDOS buckets), Step Functions, Lambda, and CloudWatch Logs

→ [Module README](modules/costanalysis/README.md) · [Example](examples/cost-analysis-support/README.md)

---

## Deployment

See the [examples](examples/) directory for sample deployments of each module.

<!-- BEGIN_TF_DOCS -->
## Providers

No providers.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
