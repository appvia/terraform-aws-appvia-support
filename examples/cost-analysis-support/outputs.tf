output "appvia_cost_analysis_support_role_arn" {
  description = "The name of the Cost Analysis Support IAM role to be assumed by the Appvia support team"
  value       = module.appvia_cost_analysis_support_role.cudos_support_arn
}
