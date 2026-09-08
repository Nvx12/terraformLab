locals {
  name_prefix = "terraform-${var.environment}"

  service_names = [
    for name in keys(var.services) : "${local.name_prefix}-${name}"
  ]
}