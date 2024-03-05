output "appvia_landing_zone_support_role_arn" {
  description = "The name of the Landing Zone Support IAM role to be assumed by the Appvia support team"
  value       = module.appvia_lza_support_role.landing_support_arn
}
