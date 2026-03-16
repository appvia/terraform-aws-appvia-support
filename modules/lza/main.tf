## Provision the support role in the account, using the above trust policy
resource "aws_iam_role" "lza_support_role" {
  name               = local.landing_zone_support_role
  assume_role_policy = data.aws_iam_policy_document.landing_zone_trust_policy.json
  tags               = var.tags
}

## Provision the IAM policy to support viewing the codepipelines
resource "aws_iam_policy" "landing_zone_policy" {
  name        = var.landing_zone_policy_name
  description = "Provides the required permissions for landing zone support"
  policy      = data.aws_iam_policy_document.landing_zone_policy.json
}

## Privision the IAM policy to support cost analysis if enabled
resource "aws_iam_policy" "cost_analysis_policy" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name        = var.cost_analysis_policy_name
  description = "Provides the required permissions for enabling cost analysis"
  policy      = data.aws_iam_policy_document.cost_analysis_policy.json
}

## Attach the managed policies for landing zone support
resource "aws_iam_role_policy_attachment" "managed_arns" {
  for_each = toset(local.landing_zone_managed_arns)

  role       = aws_iam_role.lza_support_role.name
  policy_arn = each.value
}

## Attach the custom policy for landing zone support
resource "aws_iam_role_policy_attachment" "landing_zone" {
  role       = aws_iam_role.lza_support_role.name
  policy_arn = aws_iam_policy.landing_zone_policy.arn
}

## Attach the policy for cost analysis if enabled
resource "aws_iam_role_policy_attachment" "cost_analysis" {
  count = var.enable_cost_analysis_support ? 1 : 0

  role       = aws_iam_role.lza_support_role.name
  policy_arn = aws_iam_policy.cost_analysis_policy[0].arn
}
