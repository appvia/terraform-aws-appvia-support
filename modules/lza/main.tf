#
## Related to provisioning of Appvia support 
#

#
## Retrieve the account identifier 
#
data "aws_caller_identity" "current" {}

locals {
  # Name of the IAM role provisioned in the account for landing zone support
  landing_zone_support_role = "AppviaLZASupportRole"
  # Name of the IAM role provisioned in the account for cost analysis support
  cost_analysis_support_role = "AppviaCostAnalysisSupportRole"

  # The full arn of the external role permitted access
  external_lza_role_arn = format("arn:aws:iam::%s:role/aws-reserved/sso.amazonaws.com/%s/%s",
  var.external_account_id, var.external_region, var.external_lza_role_name)
  # The full arn of the external role permitted access
  external_costanalysis_role_arn = format("arn:aws:iam::%s:role/aws-reserved/sso.amazonaws.com/%s/%s",
  var.external_account_id, var.external_region, var.external_costanalysis_role_name)
}

#
## Provision the IAM policy to support viewing the codepipelines 
#
resource "aws_iam_policy" "lza_policy" {
  name        = var.landing_zone_policy_name
  description = "Provides the required permissions for enalbing landing zone support"
  policy      = data.aws_iam_policy_document.landing_zone_policy.json
}

#
## Provision the support role in the account, using the above trust policy
#
resource "aws_iam_role" "lza_support_role" {
  name = local.landing_zone_support_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = local.external_lza_role_arn
        }
      }
    ]
  })
  tags = var.tags
}

#
## Attach the IAM policies for the landing zone role 
#
resource "aws_iam_role_policy_attachment" "lza_policies" {
  for_each = toset(local.landing_zone_policies)

  role       = aws_iam_role.lza_support_role.name
  policy_arn = each.value

  depends_on = [aws_iam_policy.lza_policy]
}

#
## Provision if required the cost analysis policy 
#
resource "aws_iam_policy" "cost_analysis_policy" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name        = var.cost_analysis_policy_name
  description = "Provides the required permissions for enalbing cost analysis"
  policy      = data.aws_iam_policy_document.cost_analysis_policy.json
}

#
## Provision an additional role required for cost analysis
#
resource "aws_iam_role" "cost_analysis_role" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name = local.cost_analysis_support_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = local.external_costanalysis_role_arn
        }
      }
    ]
  })
  tags = var.tags
}

#
## Attach if enabled the policies for the cost analysis role
#
resource "aws_iam_role_policy_attachment" "cost_analysis_policies" {
  for_each = var.enable_cost_analysis_support ? toset(local.cost_analysis_policies) : []

  role       = aws_iam_role.cost_analysis_role[0].name
  policy_arn = each.value

  depends_on = [aws_iam_policy.cost_analysis_policy]
}

