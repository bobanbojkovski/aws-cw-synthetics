locals {

  tags = {
    "Terraform" = "true"
    "team"      = "team",
    "service"   = "cw-synthetics-monitoring",
    "env"       = var.stage,
  }
}
