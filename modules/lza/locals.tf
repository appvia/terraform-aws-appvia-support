
locals {
  ## Name of the IAM role provisioned in the account for landing zone support
  landing_zone_support_role = "AppviaLZASupportRole"
  ## The full ARN of the external role permitted access
  external_lza_role_arn = format("arn:aws:iam::%s:role/aws-reserved/sso.amazonaws.com/%s/%s", var.external_account_id, var.external_region, var.external_lza_role_name)
  ## The managed policies required for the landing zone support role
  landing_zone_managed_arns = concat(
    [
      "arn:aws:iam::aws:policy/AWSOrganizationsReadOnlyAccess",
    ],
    var.enable_cost_analysis_support ? [
      "arn:aws:iam::aws:policy/AWSBillingConductorReadOnlyAccess",
      "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess",
      "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess",
  ] : [])
}

