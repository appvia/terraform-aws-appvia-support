variable "enable_cost_analysis_support" {
  description = "Enable the creation of the finops role in the customer account"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}
