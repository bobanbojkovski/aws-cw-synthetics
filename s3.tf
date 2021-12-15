module "s3" {
  source = "./modules/s3/"

  bucket         = "${var.bucket}-${var.account_id}-${var.region}"
  key            = var.key
  key_name       = var.key_name
  retention_days = var.retention_days

  depends_on = [
    module.kms
  ]

}
