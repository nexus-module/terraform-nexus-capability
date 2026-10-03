################################################################################
# Capability
################################################################################
resource "nexus_capability" "main" {
  type       = var.type
  enabled    = var.enabled
  notes      = var.notes
  properties = var.properties
}
