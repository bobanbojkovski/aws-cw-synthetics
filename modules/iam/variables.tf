variable "policy_name" {
  description = "IAM policy name"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "IAM tags"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "KMS key name"
  type        = string
  default     = ""
}

variable "bucket" {
  description = "S3 Bucket name"
  type        = string
  default     = ""
}

variable "key" {
  description = "S3 Bucket Object name"
  type        = string
  default     = ""
}
