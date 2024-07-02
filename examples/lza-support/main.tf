module "appvia_lza_support_role" {
  source = "../../modules/lza"

  enable_cost_analysis_support = var.enable_cost_analysis_support
  tags                         = var.tags
}
