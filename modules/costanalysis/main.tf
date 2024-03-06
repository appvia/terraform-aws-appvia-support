#
## Related to provisioning of Appvia support 
#

locals {
  # The name of the IAM role to be assumed by the support team 
  cost_analysis_support_role = "AppviaCostAnalysisSupportRole"

  # The full arn of the external role permitted access
  external_role = format("arn:aws:iam::%s:role/aws-reserved/sso.amazonaws.com/%s/%s",
  var.external_account_id, var.external_region, var.external_role_name)
}

#
## Provision the support role in the account, using the above trust policy
#
resource "aws_iam_role" "this" {
  name = local.cost_analysis_support_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = local.external_role
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = var.tags
}

#
## Provision the IAM policy for custom cusdos permissions 
# 
resource "aws_iam_policy" "this" {
  name        = var.cudos_policy_name
  description = "Provides the required permissions for the CUDOS platform and support"
  policy      = data.aws_iam_policy_document.policy.json
  tags        = var.tags
}

#
## Attach the required policies to the role 
# 
resource "aws_iam_role_policy_attachment" "policies" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
