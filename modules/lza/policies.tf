#
## Related to the additional permissions required for support
#
#
locals {
  # The IAM policies attached to the support role 
  landing_zone_policies = [
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/${var.landing_zone_policy_name}",
  ]

  cost_analysis_policies = [
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/${var.cost_analysis_policy_name}",
    "arn:aws:iam::aws:policy/AWSBillingConductorReadOnlyAccess",
    "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess",
    "arn:aws:iam::aws:policy/CostOptimizationHubReadOnlyAccess",
  ]
}

#
## These permission are used in the organization management account, and used to provide 
## the required permissions to support the landing zone
# 
# tfsec:ignore:aws-iam-no-policy-wildcards
data "aws_iam_policy_document" "landing_zone_policy" {
  dynamic "statement" {
    for_each = var.enable_codecommit_support ? ["yes"] : []

    content {
      sid    = "DenyCodeCommit"
      effect = "Deny"
      actions = [
        "codecommit:DeleteBranch",
        "codecommit:GitPush",
        "codecommit:MergeBranchesByFastForward",
        "codecommit:MergeBranchesBySquash",
        "codecommit:MergeBranchesByThreeWay",
        "codecommit:MergePullRequestByFastForward",
        "codecommit:MergePullRequestBySquash",
        "codecommit:MergePullRequestByThreeWay",
      ]
      resources = ["*"]

      condition {
        test     = "StringLike"
        variable = "codecommit:References"
        values   = ["refs/heads/main", "refs/heads/main/*"]
      }
    }
  }

  dynamic "statement" {
    for_each = var.enable_codecommit_support ? [] : ["no"]

    content {
      sid       = "DenyCodeCommitPush"
      effect    = "Deny"
      actions   = ["codecommit:GitPush", "codecommit:CreateCommit"]
      resources = ["*"]
    }
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
    sid    = "AllowValidateTemplate"
    effect = "Allow"
    actions = [
      "access-analyzer:ValidatePolicy",
      "cloudformation:ValidateTemplate",
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
## These permissions are used in the organization management account, and used to provide 
## the required permissions to gain insights into recommendations and cost analysis
#
# tfsec:ignore: aws-iam-no-policy-wildcards
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
