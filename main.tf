#
## Related to provisioning of Appvia support 
#

locals {
  # The IAM policies attached to the support role 
  support_policies = [
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/CostsViewer",
    "arn:aws:iam::${data.aws_caller_identity.current.id}:policy/${var.support_role_policy}",
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
## Provision a role capable of viewign the landing zone codepipeline 
#
data "aws_iam_policy_document" "additional_permissions" {
  statement {
    sid       = "DenyCodeCommitPush"
    effect    = "Deny"
    actions   = ["codecommit:GitPush", "codecommit:CreateCommit"]
    resources = ["*"]
  }

  statement {
    sid    = "AllowCostExplorerView"
    effect = "Allow"
    actions = [
      "ce:ListSavingsPlansPurchaseRecommendationGeneration",
    ]
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
## Provision the IAM policy to support viewing the codepipelines 
#
resource "aws_iam_policy" "support_policy" {
  name        = var.support_role_policy
  description = "Policy to permit external provider additional permissioned required to deliver support"
  policy      = data.aws_iam_policy_document.additional_permissions.json
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
## Attach the IAM policies to the support role
#
resource "aws_iam_role_policy_attachment" "support_policies" {
  for_each = toset(local.support_policies)

  role       = aws_iam_role.support_role.name
  policy_arn = each.value

  depends_on = [aws_iam_policy.support_policy]
}
