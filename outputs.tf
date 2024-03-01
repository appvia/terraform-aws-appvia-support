#
## Related to the outputs 
#

output "management_account_id" {
  description = "The account id of the management account"
  value       = data.aws_caller_identity.current.account_id
}

output "cudos_account_id" {
  description = "The account id of the cudos account"
  value       = var.aws_accounts["cudos"]
}

output "landing_support_arn" {
  description = "The name of the IAM role to be assumed by the support team"
  value       = aws_iam_role.support_role.arn
}

output "cudos_support_arn" {
  description = "The ARN of the IAM role to be assumed by the support team for cudos"
  value       = aws_iam_role.cudos_role[0].arn
}
