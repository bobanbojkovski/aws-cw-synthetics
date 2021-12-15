### common variables
variable "account_id" {}
variable "region" {}
variable "team" {}
variable "vpc_id" {}
variable "stage" {}


### kms variables
variable "create_kms_key" {
  description = "To create or not a KMS key"
  type        = bool
}

variable "create_kms_alias" {
  description = "To create or not KMS alias"
  type        = bool
}

variable "key_name" {
  description = "KMS key name"
  type        = string
}


### s3 variables
variable "create_bucket" {
  description = "To create or not S3 Bucket"
  type        = bool
}

variable "create_object" {
  description = "To create or not S3 Objects"
  type        = bool
}


variable "bucket" {
  description = "S3 Bucket name"
  type        = string
}

variable "key" {
  description = "S3 Bucket Object name"
  type        = string
}

variable "retention_days" {
  description = "Time retention for the canary data"
  type        = number
}


## iam variables
variable "policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "role_name" {
  description = "IAM role name"
  type        = string
}


## cw-synthetics variables
variable "name" {
  description = "Canary name"
  type        = string
}

variable "canary_settings" {
  description = "Canary configurations"
  type        = map
}

## cw-alarms variables
variable "sns_topic" {
  description = "SNS topic name"
  type        = string
}
