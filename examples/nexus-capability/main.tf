provider "nexus" {
  insecure = true
  password = "admin123"
  url      = "https://127.0.0.1:8080"
  username = "admin"
}

################################################################################
# Capability
################################################################################
module "nexus_capability" {
  source = "../../modules/nexus-capability"

  type    = "OutreachManagementCapability"
  enabled = true
  notes   = "Enable outreach management"
}
