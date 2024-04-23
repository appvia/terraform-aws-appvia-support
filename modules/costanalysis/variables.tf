variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
  default     = "730335310409"
}

variable "external_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
  default     = "AWSReservedSSO_LZASupport_ece287516c084d4f"
}

variable "external_region" {
  description = "The external region from where the support role will be assumed"
  type        = string
  default     = "eu-west-2"
}

variable "costs_analysis_policy_name" {
  description = "Customer managed support policy for cost analysis"
  type        = string
  default     = "AppviaCostAnalysisSupportPolicy"
}

variable "cudos_policy_name" {
  description = "Customer managed support policy for dashboards"
  type        = string
  default     = "AppviaCudosSupportPolicy"
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}
