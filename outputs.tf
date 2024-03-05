#
## Related to the outputs 
#

output "landing_support_arn" {
  description = "The name of the IAM role to be assumed by the support team"
  value       = aws_iam_role.support_role[0].arn
}

output "cudos_support_arn" {
  description = "The ARN of the IAM role to be assumed by the support team for cudos"
  value       = aws_iam_role.cudos_role[0].arn
}
