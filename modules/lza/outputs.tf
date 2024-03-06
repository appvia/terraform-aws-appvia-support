#
## Related to the outputs 
#

output "landing_support_role_arn" {
  description = "The name of the IAM role to be assumed by the support team"
  value       = aws_iam_role.lza_support_role.arn
}

output "cost_analysis_support_role_arn" {
  description = "The ARN of the IAM role to be assumed by the support team for cost analysis"
  value       = var.enable_cost_analysis_support ? aws_iam_role.cost_analysis_role[0].arn : "Not enabled"
}
