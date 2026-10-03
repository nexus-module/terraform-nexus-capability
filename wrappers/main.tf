module "wrapper" {
  source = "../"

  for_each = var.items

  nexus_capability = try(each.value.nexus_capability, var.defaults.nexus_capability, [])
}
