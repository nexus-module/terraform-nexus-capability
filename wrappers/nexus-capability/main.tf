module "wrapper" {
  source = "../../modules/nexus-capability"

  for_each = var.items

  enabled    = try(each.value.enabled, var.defaults.enabled, null)
  notes      = try(each.value.notes, var.defaults.notes, null)
  properties = try(each.value.properties, var.defaults.properties, null)
  type       = try(each.value.type, var.defaults.type)
}
