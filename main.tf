################################################################################
# Capability
################################################################################
module "nexus_capability" {
  source = "./modules/nexus-capability"

  for_each = { for c in var.nexus_capability : coalesce(c.key, c.type) => c }

  type       = each.value.type
  enabled    = each.value.enabled
  notes      = each.value.notes
  properties = each.value.properties
}
