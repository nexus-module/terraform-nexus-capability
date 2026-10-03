################################################################################
# Capability
################################################################################
output "id" {
  description = "Map of capability IDs, keyed by capability key."
  value       = { for k, c in module.nexus_capability : k => c.id }
}

output "type" {
  description = "Map of capability types, keyed by capability key."
  value       = { for k, c in module.nexus_capability : k => c.type }
}
