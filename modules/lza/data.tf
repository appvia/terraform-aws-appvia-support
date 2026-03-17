## Craft IAM trust policy for the landing zone support role, allowing the specified external role to assume it
data "aws_iam_policy_document" "landing_zone_trust_policy" {
  statement {
    sid    = "AllowExternalRoleAssume"
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "AWS"
      identifiers = [local.external_lza_role_arn]
    }
  }
}
