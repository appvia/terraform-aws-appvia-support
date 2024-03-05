module "appvia_cost_analysis_support_role" {
  source = "../../"

  enable_cost_analysis_support = true
  enable_landing_zone_support  = false
  external_account_id          = var.external_account_id
  external_region              = var.external_region
  external_role_name           = var.external_role_name
  tags                         = var.tags
}
