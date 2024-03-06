module "appvia_lza_support_role" {
  source = "../../modules/lza"

  enable_cost_analysis_support    = var.enable_cost_analysis_support
  external_account_id             = var.external_account_id
  external_region                 = var.external_region
  external_lza_role_name          = var.external_lza_role_name
  external_costanalysis_role_name = var.external_costanalysis_role_name
  tags                            = var.tags
}
