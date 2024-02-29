#
## Related to the outputs 
#

output "support_role_name" {
  description = "The name of the IAM role to be assumed by the support team"
  value       = var.support_role_name
}

output "support_role_arn" {
  description = "The ARN of the IAM role to be assumed by the support team"
  value       = aws_iam_role.support_role.arn
}

output "landing_zone_policy_arn" {
  description = "The ARN of the IAM policy to be attached to the support role"
  value       = aws_iam_policy.landing_zone_policy[0].arn
}

output "cost_analysis_policy_arn" {
  description = "The ARN of the IAM policy to be attached to the support role"
  value       = aws_iam_policy.cost_analysis_policy[0].arn
}
