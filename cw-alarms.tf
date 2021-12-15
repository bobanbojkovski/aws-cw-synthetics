module "cw-alarms" {
  source = "./modules/cw-alarms/"

  name      = var.name
  sns_topic = var.sns_topic

  depends_on = [
    module.cw-synthetics
  ]

}
