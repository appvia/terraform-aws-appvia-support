#
## Related to the IAM policies
#

#
## These permissions are used in the Cost Analytics accounts, and used to 
## support the cudos dashboards
#
# tfsec:ignore:aws-iam-no-policy-wildcards
data "aws_iam_policy_document" "policy" {
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

