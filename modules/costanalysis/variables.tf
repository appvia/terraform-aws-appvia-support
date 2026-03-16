variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
  default     = "148761643183"
}

variable "external_role_name" {
  description = "The external account name from where the support role will be assumed"
  type        = string
  default     = "AWSReservedSSO_LandingZoneSupport_bed6bf8641dc41f3"
}

variable "external_region" {
  description = "The external region from where the support role will be assumed"
  type        = string
  default     = "eu-west-2"
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
