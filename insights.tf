#
## Provides the ability to support the cudos platform
#

locals {
  # A collection of managed aws policies whoch should be attached to the support role
  cudos_policies = []
}

#
## These permissions are used in the Cost Analytics accounts, and used to 
## support the cudos dashboards
#
data "aws_iam_policy_document" "cudos_policy" {
  statement {
    sid    = "AllowQuickSightView"
    effect = "Allow"
    actions = [
      "quicksight:Describe*",
      "quicksight:Get*",
      "quicksight:Search*",
      "quicksight:List*",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowGlue"
    effect = "Allow"
    actions = [
      "glue:Get*",
      "glue:List*",
      "glue:Search*",
      "glue:UpdateTable"
    ]
    resources = ["*"]
  }

  statement {
    sid       = "AllowAthenaAdmin"
    effect    = "Allow"
    actions   = ["athena:*"]
    resources = ["*"]
  }

  statement {
    sid    = "AllowQuickSightAdmin"
    effect = "Allow"
    actions = [
      "quicksight:CreateAnalysis",
      "quicksight:CreateDashboard",
      "quicksight:CreateDataSet",
      "quicksight:CreateDataSource",
      "quicksight:CreateFolder",
      "quicksight:CreateFolderMembership",
      "quicksight:CreateRefreshSchedule",
      "quicksight:CreateTemplate",
      "quicksight:CreateTemplateAlias",
      "quicksight:CreateTopicRefreshSchedule",
      "quicksight:DeleteAnalysis",
      "quicksight:DeleteDashboard",
      "quicksight:DeleteDataSet",
      "quicksight:DeleteDataSetRefreshProperties",
      "quicksight:DeleteDataSource",
      "quicksight:DeleteFolder",
      "quicksight:DeleteFolderMembership",
      "quicksight:DeleteTemplate",
      "quicksight:DeleteTemplateAlias",
      "quicksight:PutDataSetRefreshProperties",
      "quicksight:RestoreAnalysis",
      "quicksight:UpdateAnalysis",
      "quicksight:UpdateAnalysisPermissions",
      "quicksight:UpdateDashboard",
      "quicksight:UpdateDashboardLinks",
      "quicksight:UpdateDashboardPermissions",
      "quicksight:UpdateDashboardPublishedVersion",
      "quicksight:UpdateDataSet",
      "quicksight:UpdateDataSetPermissions",
      "quicksight:UpdateDataSource",
      "quicksight:UpdateDataSourcePermissions",
      "quicksight:UpdateFolder",
      "quicksight:UpdateFolderPermissions",
      "quicksight:UpdateRefreshSchedule",
      "quicksight:UpdateRoleCustomPermission",
      "quicksight:UpdateTemplate",
      "quicksight:UpdateTemplateAlias",
      "quicksight:UpdateTemplatePermissions",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowS3ListBucket"
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowS3GetObject"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectRetention",
      "s3:GetObjectTagging",
      "s3:GetObjectTorrent",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]
    resources = [
      "arn:aws:s3:::aws-athena-query-results-cid-*/*",
      "arn:aws:s3:::cid-*/*",
      "arn:aws:s3:::cudos-dashboard-*"
    ]
  }

  statement {
    sid    = "AllowS3WriteResults"
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectVersionAcl",
    ]
    resources = [
      "arn:aws:s3:::aws-athena-query-results-cid-*/*",
    ]
  }
}

#
## Provision the support role in the account, using the above trust policy
#
resource "aws_iam_role" "cudos_role" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name               = var.cost_analysis_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags

  provider = aws.cudos
}

#
## Provision the IAM policy for custom cusdos permissions 
# 
resource "aws_iam_policy" "cudos_policy" {
  count = var.enable_cost_analysis_support ? 1 : 0

  name        = var.cudos_policy_name
  description = "Provides the required permissions for the CUDOS platform and support"
  policy      = data.aws_iam_policy_document.cudos_policy.json
  tags        = var.tags

  provider = aws.cudos
}

#
## Attach the required policies to the role 
#
resource "aws_iam_role_policy_attachment" "managed_cudos_policies" {
  for_each = var.enable_cost_analysis_support ? toset(local.cudos_policies) : toset([])

  role       = aws_iam_role.cudos_role[0].name
  policy_arn = each.value

  provider = aws.cudos
}

#
## Attach the required policies to the role 
# 
resource "aws_iam_role_policy_attachment" "custom_cudos_policies" {
  count = var.enable_cost_analysis_support ? 1 : 0

  role       = aws_iam_role.cudos_role[0].name
  policy_arn = aws_iam_policy.cudos_policy[0].arn

  provider = aws.cudos
}
