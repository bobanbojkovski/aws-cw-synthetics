module "iam" {
  source = "./modules/iam/"

  policy_name = "${var.policy_name}-${var.name}"
  role_name   = "${var.role_name}-${var.name}"

  key_name = var.key_name
  bucket   = "${var.bucket}-${var.account_id}-${var.region}"
  key      = var.key

  depends_on = [
    module.kms,
    module.s3
  ]

}
