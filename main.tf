#
## Related to provisioning of Appvia support 
#

locals {
  # The IAM policies attached to the support role 
  landing_zone_policies = [
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/${var.landing_zone_policy_name}",
  ]

  finops_policies = [
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/${var.costs_analysis_policy_name}",
    "arn:aws:iam::aws:policy/AWSBillingConductorReadOnlyAccess",
    "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess",
    "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess",
  ]
}

#
## Retrieve the account identifier 
#
data "aws_caller_identity" "current" {}

#
## Create a IAM trust policy to permit the external role the ability to assume 
#
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = [var.external_account_id]
    }
  }
}

#
## Provision the IAM policy to support viewing the codepipelines 
#
resource "aws_iam_policy" "landing_zone_policy" {
  count = var.enable_landing_zone_support ? 1 : 0

  name        = var.landing_zone_policy_name
  description = "Provides the required permissions for enalbing landing zone support"
  policy      = data.aws_iam_policy_document.landing_zone_policy.json
}

#
## Provision if required the cost analysis policy 
#
resource "aws_iam_policy" "cost_analysis_policy" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name        = var.costs_analysis_policy_name
  description = "Provides the required permissions for enalbing cost analysis"
  policy      = data.aws_iam_policy_document.cost_analysis_policy.json
}

#
## Provision the support role in the account, using the above trust policy
#
resource "aws_iam_role" "support_role" {
  name = var.support_role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}

#
## Attach the IAM policies for the landing zone role 
#
resource "aws_iam_role_policy_attachment" "landing_zone_policies" {
  for_each = var.enable_landing_zone_support ? toset(local.landing_zone_policies) : []

  role       = aws_iam_role.support_role.name
  policy_arn = each.value

  depends_on = [aws_iam_policy.landing_zone_policy]
}

#
## Attach if enabled the policies for the cost analysis role
#
resource "aws_iam_role_policy_attachment" "finops_policies" {
  for_each = var.enable_cost_analysis_support ? toset(local.finops_policies) : []

  role       = aws_iam_role.support_role.name
  policy_arn = each.value

  depends_on = [aws_iam_policy.cost_analysis_policy]
}

