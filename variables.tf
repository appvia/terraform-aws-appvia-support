variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
}

variable "enable_landing_zone_support" {
  description = "Enable the creation of the support role in the customer account"
  type        = bool
  default     = true
}

variable "enable_cost_analysis_support" {
  description = "Enable the creation of the finops role in the customer account"
  type        = bool
  default     = false
}

variable "support_role_name" {
  description = "The name of the role created in the customer account"
  type        = string
  default     = "LZASupportRole"
}

variable "landing_zone_policy_name" {
  description = "Customer managed support policy for landing zone"
  type        = string
  default     = "LZASupportPolicy"
}

variable "costs_analysis_policy_name" {
  description = "Customer managed support policy for cost analysis"
  type        = string
  default     = "CostAnalysisSupportPolicy"
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The AWS region where to deploy the resources"
  type        = string
}
