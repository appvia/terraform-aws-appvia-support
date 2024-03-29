variable "enable_cost_analysis_support" {
  description = "Enable the creation of the finops role in the customer account"
  type        = bool
  default     = false
}

variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
}

variable "external_region" {
  description = "The external region from where the support role will be assumed"
  type        = string
  default     = "eu-west-2"
}

variable "external_lza_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
}

variable "external_costanalysis_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}
