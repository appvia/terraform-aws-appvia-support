#
## Related to the outputs 
#

output "cost_analysis_support_role_arn" {
  description = "The ARN of the IAM role to be assumed by the support team"
  value       = aws_iam_role.this.arn
}
