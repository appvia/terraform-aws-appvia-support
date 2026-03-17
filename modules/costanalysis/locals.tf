locals {
  # The name of the IAM role to be assumed by the support team
  cost_analysis_support_role = "AppviaCostAnalysisSupportRole"

  # The full arn of the external role permitted access
  external_role = format("arn:aws:iam::%s:role/aws-reserved/sso.amazonaws.com/%s/%s", var.external_account_id, var.external_region, var.external_role_name)
}

