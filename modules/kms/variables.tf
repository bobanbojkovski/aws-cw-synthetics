variable "create_kms_key" {
  description = "To create or not a KMS key"
  type        = bool
  default     = true
}

variable "create_kms_alias" {
  description = "To create or not KMS alias"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "To enabled or not KMS key"
  type        = bool
  default     = true
}

variable "customer_master_key_spec" {
  description = "Specify KMS encryption"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "key_usage" {
  description = "Specify the intended use of the KMS key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "deletion_window_in_days" {
  description = "The length of the pending deletion window in days; defaults to 30 days"
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Enable annual key rotation by AWS"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "KMS key name"
  type        = string
  default     = ""
}
variable "account_id" {
  description = "The length of the pending deletion window in days; defaults to 30 days"
  type        = number
  default     = null
}

variable "tags" {
  description = "KMS tags"
  type        = map(string)
  default     = {}
}
