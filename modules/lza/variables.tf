variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
  default     = "730335310409"
}

variable "external_lza_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
  default     = "AWSReservedSSO_LZASupport_ece287516c084d4f"
}

variable "external_costanalysis_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
  default     = "AWSReservedSSO_LZASupport_ece287516c084d4f"
}

variable "external_region" {
  description = "The external region from where the support role will be assumed"
  type        = string
  default     = "eu-west-2"
}

variable "enable_cost_analysis_support" {
  description = "Enable the creation of the finops role in the customer account"
  type        = bool
  default     = false
}

variable "enable_codecommit_support" {
  description = "When the accelerator config is still in codecommit, we need permissions to raise changes only"
  type        = bool
  default     = false
}

variable "landing_zone_policy_name" {
  description = "Customer managed support policy for landing zone"
  type        = string
  default     = "AppviaLZASupportPolicy"
}

variable "cost_analysis_policy_name" {
  description = "Customer managed support policy for cost analysis"
  type        = string
  default     = "AppviaCostAnalysisSupportPolicy"
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
}
