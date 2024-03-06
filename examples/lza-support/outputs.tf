output "appvia_landing_zone_support_role_arn" {
  description = "The name of the Landing Zone Support IAM role to be assumed by the Appvia support team"
  value       = module.appvia_lza_support_role.landing_support_role_arn
}

output "appvia_cost_analysis_support_role_arn" {
  description = "The ARN of the IAM role to be assumed by the support team for cost analysis"
  value       = module.appvia_lza_support_role.cost_analysis_support_role_arn
}
