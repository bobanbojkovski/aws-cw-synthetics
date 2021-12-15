variable "create_bucket" {
  description = "To create or not a S3 bucket"
  type        = bool
  default     = true
}

variable "create_object" {
  description = "To create or not S3 objects"
  type        = bool
  default     = true
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

variable "acl" {
  description = "S3 ACL"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "S3 bucket and objects tags"
  type        = map(string)
  default     = {}
}

variable "retention_days" {
  description = "Time retention for the canary data"
  type        = number
  default     = null
}

variable "key_name" {
  description = "KMS key name"
  type        = string
  default     = ""
}
