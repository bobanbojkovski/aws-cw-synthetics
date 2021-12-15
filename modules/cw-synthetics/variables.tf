variable "name" {
  description = "Canary name"
  type        = string
  default     = ""
}

variable "runtime_version" {
  description = "Canary runtime version"
  type        = string
  default     = ""
}

variable "handler_name" {
  description = "Canary entry point to use for the source code when running the canary"
  type        = string
  default     = ""
}

# Note: scheduled events use UTC time zone and the minimum precision for schedules is 1 minute
variable "schedule_rate_expression" {
  description = "How often (in minutes) the canary is to run and when these test runs are to stop"
  type        = string
  default     = ""
}

# Note: scheduled events use UTC time zone and the minimum precision for schedules is 1 minute
variable "schedule_cron_expression" {
  description = "Cron scheduler to speify when the canary shall run"
  type        = string
  default     = ""
}

variable "duration_time" {
  description = "Duration in seconds, for the canary to continue making regular runs according to the schedule in the Expression value"
  type        = number
  default     = 840
}

variable "success_retention_period" {
  description = "Number of days to retain data about successful runs of this canary. Default is 31 days"
  type        = number
  default     = null
}

variable "failure_retention_period" {
  description = "Number of days to retain data about failed runs of this canary. Default is 31 days"
  type        = number
  default     = null
}

variable "config_timeout_in_seconds" {
  description = "Number of seconds the canary is allowed to run"
  type        = number
  default     = 300
}

variable "config_memory_in_mb" {
  description = "Maximum amount of memory available to the canary while it is running, in MB. The value you specify must be a multiple of 64"
  type        = number
  default     = 1024
}

variable "config_active_tracing" {
  description = "To use active AWS X-Ray tracing or not"
  type        = bool
  default     = false
}

variable "start_canary" {
  description = "To run or not the canary, after the creation"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Canary tags"
  type        = map(string)
  default     = {}
}

variable "bucket" {
  description = "S3 Bucket name"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC id where the monitored apps are running"
  type        = string
  default     = null
}

variable "security_group_id" {
  description = "Security group id to allow access to the monitored apps"
  type        = string
  default     = null
}
