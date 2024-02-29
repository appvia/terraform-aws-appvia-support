#
## Related to the additional permissions required for support
#

#
## Provision the landing zone support policy 
# 
data "aws_iam_policy_document" "landing_zone_policy" {
  statement {
    sid       = "DenyCodeCommitPush"
    effect    = "Deny"
    actions   = ["codecommit:GitPush", "codecommit:CreateCommit"]
    resources = ["*"]
  }

  statement {
    sid       = "AllowCodePipelineTrigger"
    effect    = "Allow"
    actions   = ["codepipeline:RetryStageExecution", "codepipeline:StartPipelineExecution", "codepipeline:StopPipelineExecution"]
    resources = ["arn:aws:codepipeline:*:*:AWSAccelerator-Pipeline"]
  }

  statement {
    sid    = "AllowCodePipelineView"
    effect = "Allow"
    actions = [
      "codepipeline:GetPipeline",
      "codepipeline:GetPipelineExecution",
      "codepipeline:GetPipelineState",
      "codepipeline:ListPipelines",
      "codepipeline:ListPipelineExecutions",
      "codepipeline:ListPipelineExecutionsForPipeline",
      "codepipeline:ListWebhooks",
      "codepipeline:ListTagsForResource"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowCodeCommitView"
    effect = "Allow"
    actions = [
      "codecommit:GetApprovalRuleTemplate",
      "codecommit:GetRepository",
      "codecommit:ListApprovalRuleTemplates",
      "codecommit:ListRepositories",
      "codecommit:ListRepositoriesForApprovalRuleTemplate"
    ]
    resources = ["*"]
  }

  statement {
    sid       = "AllowCodeBuildView"
    effect    = "Allow"
    actions   = ["codebuild:List*", "codebuild:Get*", "codebuild:BatchGet*"]
    resources = ["*"]
  }

  statement {
    sid       = "AllowCodeCommitActions"
    effect    = "Allow"
    actions   = ["codecommit:*"]
    resources = ["arn:aws:codecommit:*:*:aws-accelerator-config"]
  }

  statement {
    sid       = "AllowCodeCommitLogs"
    effect    = "Allow"
    actions   = ["logs:GetLogEvents"]
    resources = ["arn:aws:logs:*:*:log-group:/aws/codebuild/AWSAccelerator*"]
  }
}

#
## Provision the cost analysis support policy 
#
data "aws_iam_policy_document" "cost_analysis_policy" {
  statement {
    sid    = "AllowCostExplorerView"
    effect = "Allow"
    actions = [
      "ce:Describe*",
      "ce:Get*",
      "ce:List*",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowBillingView"
    effect = "Allow"
    actions = [
      "aws-portal:ViewBilling",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowCarbonFootprint"
    effect = "Allow"
    actions = [
      "sustainability:GetCarbonFootprintSummary",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowReportConsole"
    effect = "Allow"
    actions = [
      "aws-portal:ViewBilling",
      "aws-portal:ViewUsage",
      "cur:DeleteReportDefinition",
      "cur:DescribeReportDefinitions",
      "cur:ModifyReportDefinition",
      "cur:PutReportDefinition",
    ]
    resources = ["*"]
  }
}

