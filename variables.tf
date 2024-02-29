variable "external_role_name" {
  description = "The name of the role in the external role permitted to assume"
  type        = string
  default     = ""
}

variable "external_account_id" {
  description = "The external account id from where the support role will be assumed"
  type        = string
}

variable "support_role_name" {
  description = "The name of the role created in the customer account"
  type        = string
  default     = "LZASupportRole"
}

variable "support_role_policy" {
  description = "Customer managed support used to provided additional permissions to the support role"
  type        = string
  default     = "LZASupportPolicy"
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
