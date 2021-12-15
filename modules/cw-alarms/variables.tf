variable "name" {
  description = "Canary alarm name"
  type        = string
  default     = ""
}

variable "sns_topic" {
  description = "SNS topic name"
  type        = string
  default     = ""
}

variable "treat_missing_data" {
  description = "How to treat missing data"
  type        = string
  default     = "ignore"
}
